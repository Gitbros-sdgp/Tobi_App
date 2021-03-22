# Imports
from tensorflow.keras.preprocessing.image import ImageDataGenerator
import os
import numpy as np
import pandas as pd
import cv2 as cv
from glob import glob
import tensorflow as tf
from tensorflow.keras.layers import *
from tensorflow.keras.applications import MobileNetV2
from tensorflow.keras.callbacks import ModelCheckpoint, ReduceLROnPlateau
from tensorflow.keras.optimizers import Adam
from sklearn.model_selection import train_test_split

# Builds the layers of the model

def build_model(size, num_classes):
    inputs = Input((size, size, 3))
    backbone = MobileNetV2(input_tensor=inputs, include_top=False, weights='imagenet')
    backbone.trainable = True
    x = backbone.output
    x = GlobalAveragePooling2D()(x)
    x = Dropout(0.2)(x)
    x = Dense(1024, activation='relu')(x)
    x = Dense(num_classes, activation='softmax')(x)

    model = tf.keras.Model(inputs, x)
    return model

def read_img(path, size):
    image = cv.imread(path, cv.IMREAD_COLOR)
    image = cv.resize(image, (size, size))
    image = image / 255.0
    image = image.astype(np.float32)

    return image

def parse_data(input, output):
    input = input.decode()

    num_classes = 5
    img_size = 224

    image = read_img(input, img_size)
    labels = [0] * num_classes
    labels[output] = 1
    labels = np.array(labels)
    labels = labels.astype(np.int32)

    return image, labels

def tf_parse(input, output):
    input, output = tf.numpy_function(parse_data, [input, output], [tf.float32, tf.int32])
    input.set_shape((224, 224, 3))
    output.set_shape((5))
    return input, output

def tf_dataset(input, output, batch_size = 16):
    dataset = tf.data.Dataset.from_tensor_slices((input, output))
    dataset = dataset.map(tf_parse)
    dataset = dataset.batch(batch_size)
    dataset = dataset.repeat()

    return dataset

if __name__ == '__main__':
    path = 'C:\Tobi\Emotion_Dataset'
    train_dir = os.path.join(path, 'Train/*')
    labels_dir = os.path.join(path, 'Labels.csv')

    labels_read = pd.read_csv(labels_dir)
    emotion = labels_read['Emotion'].unique()
    print('Number of dog Emotion: ', len(emotion))

    emotion2ids = {name: i for i, name in enumerate(emotion)}

    ids = glob(train_dir)
    img_labels = []

    for image_id in ids:
        image_id = image_id.split('\\')[-1].split('_')[0]
        emotion_names = list(labels_read[labels_read.id == image_id]['Emotion'])[0]
        index = emotion2ids[emotion_names]
        img_labels.append(index)

    ids = ids[:745]
    img_labels = img_labels[:745]

    # Spliting into train anda validation

    x_train, x_val = train_test_split(ids, test_size=0.2, random_state=42)
    y_train, y_val = train_test_split(img_labels, test_size=0.2, random_state=42)



    # Set Parameters

    img_size = 224
    num_classes = 5
    lr = 1e-4
    batch_size = 16
    epochs = 10

    # Model

    model = build_model(img_size, num_classes)
    model.compile(loss='categorical_crossentropy', optimizer=Adam(lr), metrics=['acc'])
    # model.summary()

    # Getting the data

    train_data = tf_dataset(x_train, y_train, batch_size=batch_size)
    val_data = tf_dataset(x_val, y_val, batch_size=batch_size)

    # Training

    callbacks = [
        ModelCheckpoint('Emotion_Model.h5', verbose=1, save_best_only=True),
        ReduceLROnPlateau(factor=0.1, patience=5, min_lr=1e-6)
    ]

    train_steps = (len(x_train) // batch_size) + 1
    val_steps = (len(x_val) // batch_size) + 1
    model.fit(
        train_data,
        steps_per_epoch=train_steps,
        validation_steps=val_steps,
        validation_data=val_data,
        epochs=epochs,
        callbacks=callbacks
    )