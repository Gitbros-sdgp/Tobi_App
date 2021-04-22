# Imports
import cv2
import glob
import os
from EmotionImage.emotionClassification import emotionClassification as emo

def videoToFrame(video):
    cap = cv2.VideoCapture(video)
    i = 0
    images = []
    while (cap.isOpened()):
        ret, frame = cap.read()
        if ret == False:
            break
        images.append(cv2.imwrite('Test/temp' + str(i) + '.jpg', frame))
        i += 1

    cap.release()
    cv2.destroyAllWindows()
    cv2.waitKey(1)

    happyCount = 0
    angryCount = 0
    sadCount = 0
    guiltyCount = 0
    prideCount = 0

    for filename in glob.glob('Test/*.jpg'): #assuming gif
        t = emo.verifyEmotion(self=emo, path=filename, size=224)
        # print(t)
        if t == 'Happy':
            happyCount += 1
        elif t == 'Angry':
            angryCount += 1
        elif t == 'Sad':
            sadCount += 1
        elif t == 'Guilty':
            guiltyCount += 1
        elif t == 'Pride':
            prideCount += 1

    label = ['Happy', 'Angry', 'Sad', 'Guilty', 'Pride']
    results = [happyCount, angryCount, sadCount, guiltyCount, prideCount]

    for filename in glob.glob('Test/*.jpg'):
        os.remove(filename)

    return label[results.index(max(results))]



