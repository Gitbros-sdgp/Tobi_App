from moviepy.editor import *

def videoToAudio(video):
    audioclip = AudioFileClip(video)
    audioclip.write_audiofile('Test2/test.wav')
    return 'Test2/test.wav'