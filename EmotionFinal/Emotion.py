# Imports
import glob
import os
from EmotionAudio.inference import audio_classify as audio
from EmotionImage.videoFrames import videoToFrame as vid
from EmotionImage.audioClip import videoToAudio as clip

argv = []

def verifyEmotion(video):

    x = vid(video=video)
    loca = clip(video=video)
    argv.append(loca)
    y, z = audio(argv)

    data = {
        'emotionName': x,
        'soundName': y,
        'soundPercentage': z
    }

    for filename in glob.glob('Test2/*.wav'):
        os.remove(filename)

    return data