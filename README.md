Converts the Exile Eden plugin export from the InitServer.sqf format back to a usable/editable Eden format.

There is a minimal change in position on some objects, and if objects from the source data were placed too deep into the ground, there might be a slightly bigger deviation for the Z axis in the conversion.
Should still save a lot of time if you lost your source file for Eden. 
Feel free to contribute if you can make it more precise.


# Objects spawned via the initServer.sqf code as comparison.
![20250302150319_1](https://github.com/user-attachments/assets/94fe35bc-7434-4de0-b351-a885c6702df3)


# Objects spawned with the ExileReverseEdenConverter
![20250302150305_1](https://github.com/user-attachments/assets/0a0eddc5-eda8-4015-8f90-1a72613cdfd9)


# How-To-Use

Paste/replace your source _objects array from your initServer.sqf ExileEden Plugin export at the top of the code from inside the provided ExileReverseEdenConverter.sqf and execute the code in the debug console.

