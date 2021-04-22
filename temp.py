import cv2

vidcap = cv2.VideoCapture('D:\IIT Stuff\SDGP\API\Test2\snoop1.mp4')
success,image = vidcap.read()
count = 0
while success:
  cv2.imwrite("D:/IIT Stuff/SDGP/API/Test1/frame%d.jpg" % count, image)     # save frame as JPEG file
  success,image = vidcap.read()
  count += 1