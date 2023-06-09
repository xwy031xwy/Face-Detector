# Face-Detector
Face detection matlab application based on skin tone detection, Binary Masking Maximum and Link Domain Determination.

## Theme: 
A program that identifies the position of a face from a photo of a person
## Goal: 
- Exclude other skin effects in the case of human photography
- Aim to correctly position the face

# Methods
After loading the image,
1. Skin Detection 
2. Binary mask processing 
3. Maximum consolidation area estimation
4. Final judgment (aspect ratio and both eyes) 

![Flow Chart](IMG/Flow.png)

# 1. Skin Detection
Use the YCbCr color space, which is most used for skin detection
Area extraction of skin by threshold

![YCbCr](IMG/YCbCr.png)

# 2. Binary mask processing 
- Morphology Opening
  - Shrink followed by expansion on an image
  - Imopen function for easy processing

![Morphology Opening](IMG/Morphology Opening.png)
![The outcome of step1 and 2](IMG/Outcome(Step1and2).png)

# 3. Maximum Connectivity Area Estimation
- Maximum Binding Area
 - Based on 8 connections (a total of 8 adjacent points including diagonal points), maximum from multiple connection zones
 - The bwlabel function takes out the connected area, and the coordinates of the rectangle are obtained for the position of the face.
 - The find function can get the index of the maximum concatenated area

![The outcome of step3](IMG/Outcome(Step3).png)

# 4. Final verdict
## aspect ratio
- Considering errors such as judging the face along with the neck
      → Detection range aspect ratio set from 0.5 to 2.0
- For large aspect ratios (greater than 1.6)
      → height increased by 0.75 times original
- For small aspect ratios (less than 1, 0)
      → width increased by 0.80 times the original

## Eyes
- Establish the presence of the eye by the 8 concatenation judgment method described above
- Before judging, reverse the black and white areas in the range
- Create a findeye.m function and set the return value of 1 and 0 depending on whether both eyes are included

![Outcome](IMG/Outcome1.png)

# Application execution example

![Application execution example](IMG/Example.png)

# Instruction
## English
1. Program main file face_detector.m
	This program consists of three files: face_detector.m, findeye.m, and skim.m.
	How to run: Open face_detector.m -> Load any image into I -> Run

2. Application: face_detector.mlapp
	- face_detector.mlapp: The main application file.
		How to run: Open in MATLAB.

	- face_detector.mlappinstall: The installation program.
		How to run: Install -> MATLAB App -> Open face_detector in My Apps.

	How to use the application:

	1. Click "Select Image..." to choose a file.
	2. Click "Run" to display the binary image and detection results.
	3. Click "Clear" to reset the program.

## 日本語
1.プログラム本体 face_detector.m

	今回のプログラムは、
	face_detector.m
	findeye.m
	skim.m
	の3つのファイルからできている。
	
	実行方法：face_detector.mを開く→任意の画像を読み込んでIに入れる→実行

2.アプリケーション face_detector.mlapp

	・face_detector.mlapp:アプリケーション本体
		実行方法：MATLABから開く
	
	・face_detector.mlappinstall:インストールプログラム
		実行方法：インストール→MARTLABのアプリ→マイアプリ→face_detectorを開く

	アプリの使い方：
	1. 「画像を選択...」ボタンを押し、ファイルを選ぶ。
	2. 「実行」ボタンを押し、二値化画像と検出結果が順に示される。
	3. 「クリア」ボタンを押し、プログラムがリセットされる。
