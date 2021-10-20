#  IupList: Example in Nim
#  Creates a dialog with three frames, each one containing a list.
#  The first is a simple list, the second one is a multiple list and the last one is a drop-down list.
#  The second list has a callback associated.

import niup
import niupext
import strformat

proc load_image_Tecgraf():PIhandle =
  var image = GetHandle("Tecgraf")
  if image == nil:
    let imgdata =
      [
      0'u8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 88, 95, 108, 1, 90, 100, 117, 99, 123, 138, 166, 126, 137, 152, 181, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 95, 105, 123, 147, 122, 137, 165, 255, 136, 152, 183, 255, 132, 149, 179, 250, 133, 149, 178, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 92, 100, 115, 43, 111, 125, 150, 253, 140, 158, 190, 255, 135, 151, 182, 255, 132, 149, 179, 255, 131, 147, 177, 217, 153, 164, 188, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 102, 113, 134, 148, 134, 151, 182, 255, 137, 154, 185, 255, 115, 129, 154, 252, 114, 128, 155, 255, 130, 146, 175, 255, 132, 147, 175, 71, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 158, 159, 162, 3, 108, 121, 145, 230, 144, 162, 195, 255, 137, 154, 185, 197, 74, 79, 86, 45, 41, 46, 55, 246, 120, 134, 162, 255, 129, 145, 174, 156, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 95, 101, 113, 48, 124, 139, 167, 255, 144, 161, 194, 255, 138, 155, 186, 67, 0, 0, 0, 0, 49, 54, 62, 150, 87, 98, 118, 255, 128, 144, 173, 223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 102, 113, 132, 105, 137, 154, 185, 255, 139, 156, 188, 231, 143, 159, 187, 3, 0, 0, 0, 0, 64, 68, 76, 61, 70, 79, 95, 255, 127, 143, 172, 254, 134, 149, 175, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 109, 121, 142, 153, 141, 159, 191, 255, 139, 156, 188, 164, 0, 0, 0, 0, 0, 0, 0, 0, 79, 82, 87, 3, 69, 77, 92, 241, 122, 137, 165, 255, 127, 142, 170, 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 110, 122, 146, 191, 145, 163, 196, 255, 139, 156, 188, 107, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 77, 86, 101, 190, 115, 129, 156, 255, 126, 141, 170, 113, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 112, 125, 149, 227, 150, 168, 201, 255, 141, 157, 188, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 82, 91, 107, 144, 113, 127, 153, 255, 125, 140, 169, 144, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 163, 165, 167, 2, 112, 125, 150, 252, 155, 173, 203, 255, 143, 159, 189, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 85, 94, 110, 109, 114, 128, 155, 255, 125, 140, 168, 175, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 160, 167, 181, 1, 120, 130, 149, 33, 48, 53, 59, 69, 43, 46, 52, 100, 50, 54, 59, 137, 116, 130, 156, 255, 155, 171, 201, 255, 105, 118, 142, 155, 104, 117, 141, 151, 105, 118, 141, 151, 105, 118, 142, 151, 101, 113, 136, 185, 111, 124, 150, 255, 116, 130, 156, 220, 112, 125, 148, 95, 115, 127, 150, 67, 123, 134, 156, 33, 168, 176, 190, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 119, 129, 147, 5, 109, 121, 142, 71, 106, 118, 140, 140, 105, 117, 140, 197, 107, 120, 144, 242, 120, 135, 162, 255, 123, 137, 163, 255, 44, 49, 58, 255, 28, 32, 39, 255, 125, 139, 164, 255, 150, 167, 197, 255, 138, 155, 186, 255, 131, 148, 178, 255, 125, 141, 170, 255, 119, 134, 162, 255, 114, 128, 154, 255, 108, 122, 147, 255, 104, 117, 141, 255, 102, 115, 138, 255, 103, 116, 139, 255, 107, 120, 145, 255, 111, 124, 149, 245, 113, 126, 151, 200, 113, 127, 152, 140, 116, 129, 154, 71, 122, 135, 158, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 118, 128, 145, 14, 106, 118, 140, 130, 104, 116, 139, 234, 105, 118, 142, 255, 128, 144, 173, 255, 147, 165, 199, 255, 157, 177, 213, 255, 150, 168, 202, 255, 140, 156, 187, 229, 41, 45, 52, 196, 39, 43, 51, 183, 130, 143, 168, 255, 144, 161, 192, 233, 109, 122, 145, 109, 105, 116, 138, 109, 99, 110, 130, 109, 92, 103, 123, 109, 91, 100, 117, 145, 97, 109, 131, 255, 95, 106, 128, 248, 74, 83, 97, 193, 64, 72, 85, 227, 56, 63, 75, 255, 55, 62, 75, 255, 65, 73, 88, 255, 90, 101, 121, 255, 111, 125, 150, 255, 114, 128, 154, 236, 116, 129, 155, 130, 127, 140, 165, 16, 0, 0, 0, 0,
      95, 101, 113, 22, 103, 115, 137, 220, 103, 116, 140, 255, 110, 123, 148, 255, 146, 165, 198, 255, 147, 165, 197, 232, 142, 158, 188, 147, 131, 144, 169, 78, 115, 123, 139, 20, 0, 0, 0, 0, 0, 0, 0, 0, 91, 97, 108, 68, 128, 142, 167, 255, 144, 162, 193, 212, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 95, 100, 107, 31, 120, 135, 163, 255, 133, 150, 180, 231, 0, 0, 0, 0, 0, 0, 0, 0, 86, 89, 93, 20, 50, 54, 61, 73, 37, 40, 46, 141, 33, 36, 42, 230, 46, 52, 63, 255, 107, 120, 144, 255, 116, 130, 157, 255, 118, 133, 159, 223, 132, 147, 174, 24,
      76, 83, 95, 114, 104, 117, 140, 255, 105, 117, 141, 255, 118, 133, 160, 253, 139, 155, 184, 116, 134, 143, 161, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 93, 100, 110, 74, 122, 137, 163, 255, 143, 160, 191, 200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 110, 114, 120, 31, 123, 138, 166, 255, 136, 153, 183, 228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 90, 93, 97, 5, 42, 45, 51, 111, 86, 97, 117, 253, 118, 133, 160, 255, 119, 133, 161, 255, 133, 149, 180, 116,
      46, 50, 56, 109, 67, 76, 91, 255, 105, 118, 142, 255, 107, 120, 145, 254, 112, 125, 149, 131, 127, 139, 161, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 93, 98, 109, 74, 116, 130, 156, 255, 142, 159, 190, 200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 112, 115, 122, 31, 128, 143, 172, 255, 141, 157, 185, 228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 124, 137, 163, 7, 122, 136, 162, 122, 120, 135, 162, 254, 121, 136, 164, 255, 136, 152, 184, 255, 126, 141, 168, 116,
      71, 74, 79, 17, 31, 35, 41, 206, 42, 47, 57, 255, 77, 87, 105, 255, 103, 116, 140, 255, 110, 124, 149, 239, 112, 125, 150, 157, 115, 128, 153, 89, 122, 134, 158, 30, 147, 158, 177, 2, 0, 0, 0, 0, 81, 87, 96, 65, 109, 123, 148, 255, 141, 158, 190, 212, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 98, 103, 112, 31, 135, 151, 180, 255, 141, 156, 183, 231, 0, 0, 0, 0, 153, 164, 183, 1, 134, 147, 171, 30, 124, 138, 165, 84, 123, 138, 165, 154, 122, 137, 164, 235, 127, 143, 172, 255, 140, 157, 189, 255, 144, 162, 195, 255, 129, 144, 172, 218, 126, 138, 161, 22,
      0, 0, 0, 0, 64, 68, 73, 7, 39, 43, 49, 118, 32, 36, 42, 225, 30, 35, 42, 255, 50, 57, 68, 255, 72, 81, 97, 255, 91, 102, 123, 255, 105, 118, 142, 255, 113, 127, 152, 240, 115, 129, 155, 204, 111, 124, 149, 196, 111, 125, 150, 255, 126, 141, 170, 234, 119, 133, 159, 120, 120, 134, 160, 116, 121, 135, 161, 117, 121, 135, 162, 119, 116, 130, 155, 152, 127, 142, 170, 255, 125, 140, 168, 248, 123, 138, 166, 199, 130, 145, 173, 235, 140, 155, 183, 255, 143, 160, 190, 255, 143, 161, 193, 255, 147, 165, 199, 255, 145, 164, 197, 255, 132, 148, 177, 230, 127, 140, 166, 126, 124, 134, 151, 12, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 138, 141, 144, 3, 55, 58, 63, 58, 37, 40, 46, 126, 34, 38, 44, 184, 34, 38, 44, 235, 35, 39, 47, 254, 49, 55, 66, 255, 64, 72, 87, 255, 77, 87, 104, 255, 88, 98, 118, 255, 96, 108, 130, 255, 103, 116, 139, 255, 108, 122, 147, 255, 113, 127, 153, 255, 118, 133, 160, 255, 124, 140, 168, 255, 133, 148, 176, 255, 141, 156, 183, 255, 146, 161, 187, 255, 144, 159, 186, 255, 131, 146, 174, 254, 127, 141, 168, 237, 126, 141, 168, 188, 123, 137, 162, 131, 112, 123, 143, 61, 128, 132, 140, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 91, 94, 98, 19, 64, 68, 73, 56, 53, 57, 65, 82, 62, 67, 76, 116, 66, 74, 89, 255, 95, 107, 129, 255, 80, 88, 103, 155, 81, 90, 105, 151, 86, 95, 112, 151, 95, 104, 122, 151, 98, 109, 128, 180, 124, 139, 166, 255, 109, 122, 146, 218, 100, 110, 128, 84, 96, 104, 118, 56, 105, 109, 117, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 173, 174, 176, 2, 74, 83, 98, 252, 131, 147, 178, 255, 140, 155, 184, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 122, 134, 157, 114, 151, 169, 203, 255, 123, 138, 165, 174, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 68, 76, 90, 224, 122, 137, 165, 255, 136, 152, 182, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 125, 139, 165, 147, 146, 164, 198, 255, 122, 137, 165, 144, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 62, 69, 81, 191, 110, 124, 149, 255, 134, 151, 181, 113, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 128, 143, 170, 193, 142, 160, 192, 255, 122, 137, 164, 111, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 58, 63, 74, 150, 94, 105, 127, 255, 133, 149, 179, 166, 0, 0, 0, 0, 0, 0, 0, 0, 115, 119, 128, 5, 130, 145, 174, 242, 137, 154, 186, 255, 125, 139, 166, 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 54, 58, 66, 102, 72, 81, 97, 255, 132, 148, 178, 236, 148, 161, 187, 5, 0, 0, 0, 0, 110, 121, 140, 64, 140, 157, 189, 255, 127, 142, 171, 254, 131, 144, 169, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 62, 65, 71, 43, 47, 52, 63, 255, 127, 143, 172, 255, 132, 148, 177, 75, 0, 0, 0, 0, 121, 134, 158, 160, 139, 156, 188, 255, 123, 138, 165, 223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 154, 156, 158, 1, 36, 39, 46, 227, 106, 119, 143, 255, 130, 145, 175, 203, 114, 125, 147, 51, 123, 138, 166, 247, 131, 147, 177, 255, 123, 138, 165, 151, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 37, 41, 47, 143, 68, 77, 93, 255, 128, 144, 174, 255, 126, 141, 170, 252, 129, 145, 174, 255, 123, 138, 166, 255, 127, 141, 167, 68, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 65, 68, 73, 40, 34, 38, 46, 250, 117, 131, 158, 255, 126, 142, 171, 255, 124, 140, 168, 255, 125, 139, 166, 214, 140, 152, 172, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 41, 44, 50, 134, 58, 66, 79, 255, 123, 138, 166, 255, 123, 138, 166, 250, 127, 140, 165, 66, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 154, 156, 158, 1, 46, 50, 55, 83, 82, 89, 102, 123, 106, 116, 136, 51, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      ]

    let p_imgdata = cast[ptr uint8](unsafeAddr(imgdata))
    image = ImageRGBA(32, 32, p_imgdata)
    SetHandle("Tecgraf", image)

  return image

let image_data_24 =
  [
  000'u8,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,
  000,000,000,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,000,000,000,
  000,000,000,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,000,000,000,
  000,000,000,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,000,000,000,
  000,000,000,255,255,255,255,255,255,255,255,255,255,000,000,255,000,000,255,000,000,255,000,000,255,000,000,255,000,000,000,255,000,000,255,000,000,255,000,000,255,000,000,255,000,255,255,255,255,255,255,255,255,255,255,255,255,000,000,000, 
  000,000,000,255,255,255,255,255,255,255,255,255,255,000,000,255,000,000,255,000,000,255,000,000,255,000,000,255,000,000,000,255,000,000,255,000,000,255,000,000,255,000,000,255,000,255,255,255,255,255,255,255,255,255,255,255,255,000,000,000, 
  000,000,000,255,255,255,255,255,255,255,255,255,255,000,000,255,000,000,255,000,000,255,000,000,255,000,000,255,000,000,000,255,000,000,255,000,000,255,000,000,255,000,000,255,000,255,255,255,255,255,255,255,255,255,255,255,255,000,000,000, 
  000,000,000,255,255,255,255,255,255,255,255,255,255,000,000,255,000,000,255,000,000,255,000,000,255,000,000,255,000,000,000,255,000,000,255,000,000,255,000,000,255,000,000,255,000,255,255,255,255,255,255,255,255,255,255,255,255,000,000,000, 
  000,000,000,255,255,255,255,255,255,255,255,255,255,000,000,255,000,000,255,000,000,255,000,000,255,000,000,255,000,000,000,255,000,000,255,000,000,255,000,000,255,000,000,255,000,255,255,255,255,255,255,255,255,255,255,255,255,000,000,000, 
  000,000,000,255,255,255,255,255,255,255,255,255,255,000,000,255,000,000,255,000,000,255,000,000,255,000,000,255,000,000,000,255,000,000,255,000,000,255,000,000,255,000,000,255,000,255,255,255,255,255,255,255,255,255,255,255,255,000,000,000, 
  000,000,000,255,255,255,255,255,255,255,255,255,000,000,255,000,000,255,000,000,255,000,000,255,000,000,255,000,000,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,000,000,000, 
  000,000,000,255,255,255,255,255,255,255,255,255,000,000,255,000,000,255,000,000,255,000,000,255,000,000,255,000,000,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,000,000,000, 
  000,000,000,255,255,255,255,255,255,255,255,255,000,000,255,000,000,255,000,000,255,000,000,255,000,000,255,000,000,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,000,000,000, 
  000,000,000,255,255,255,255,255,255,255,255,255,000,000,255,000,000,255,000,000,255,000,000,255,000,000,255,000,000,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,000,000,000, 
  000,000,000,255,255,255,255,255,255,255,255,255,000,000,255,000,000,255,000,000,255,000,000,255,000,000,255,000,000,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,000,000,000, 
  000,000,000,255,255,255,255,255,255,255,255,255,000,000,255,000,000,255,000,000,255,000,000,255,000,000,255,000,000,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,000,000,000,
  000,000,000,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,000,000,000,
  000,000,000,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,000,000,000,
  000,000,000,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,000,000,000,
  000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000
  ]

proc load_image_LogoTecgraf():PIhandle =
  var image = GetHandle("LogoTecgraf")
  if image == nil:
    let imgdata =
      [
      0'u8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 108, 120, 143, 125, 132, 148, 178, 173, 133, 149, 178, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 110, 130, 48, 130, 147, 177, 254, 124, 139, 167, 254, 131, 147, 176, 137, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 115, 128, 153, 134, 142, 159, 191, 194, 47, 52, 61, 110, 114, 128, 154, 222, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 128, 143, 172, 192, 140, 156, 188, 99, 65, 69, 76, 16, 97, 109, 131, 251, 129, 144, 172, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 131, 147, 175, 232, 140, 157, 188, 43, 0, 0, 0, 0, 100, 112, 134, 211, 126, 141, 169, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 72, 78, 88, 26, 48, 52, 57, 60, 135, 150, 178, 254, 108, 121, 145, 83, 105, 118, 142, 76, 106, 119, 143, 201, 118, 133, 159, 122, 117, 129, 152, 25, 168, 176, 190, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      118, 128, 145, 3, 104, 117, 140, 92, 114, 127, 152, 180, 131, 147, 177, 237, 133, 149, 178, 249, 38, 42, 50, 222, 137, 152, 180, 249, 126, 142, 170, 182, 114, 128, 154, 182, 104, 117, 140, 227, 95, 107, 128, 238, 83, 93, 112, 248, 84, 95, 113, 239, 104, 117, 141, 180, 115, 129, 155, 93, 127, 140, 165, 4,
      98, 109, 130, 153, 109, 123, 147, 254, 145, 163, 195, 153, 138, 154, 182, 56, 115, 123, 138, 5, 92, 99, 109, 35, 134, 149, 177, 230, 0, 0, 0, 0, 0, 0, 0, 0, 120, 133, 159, 143, 135, 151, 181, 115, 86, 89, 93, 5, 41, 45, 51, 54, 40, 45, 53, 150, 107, 120, 144, 254, 122, 137, 164, 154,
      51, 57, 66, 147, 83, 93, 112, 255, 108, 121, 145, 159, 113, 126, 151, 62, 123, 136, 159, 8, 87, 93, 103, 35, 125, 141, 169, 230, 0, 0, 0, 0, 0, 0, 0, 0, 129, 143, 169, 143, 140, 156, 184, 115, 134, 147, 172, 8, 124, 138, 165, 60, 124, 139, 167, 155, 131, 147, 177, 255, 131, 147, 176, 153,
      64, 68, 73, 2, 36, 39, 45, 86, 41, 46, 54, 173, 60, 67, 80, 232, 75, 84, 101, 251, 89, 100, 120, 228, 105, 118, 142, 250, 110, 123, 148, 187, 118, 132, 158, 187, 126, 141, 169, 229, 134, 149, 177, 239, 136, 152, 179, 250, 136, 152, 181, 234, 139, 156, 186, 175, 130, 145, 173, 90, 124, 134, 151, 3,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 71, 74, 79, 19, 60, 64, 73, 50, 92, 103, 124, 254, 86, 95, 111, 84, 90, 100, 117, 76, 126, 141, 168, 201, 113, 126, 150, 119, 99, 105, 117, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 93, 105, 125, 231, 135, 151, 181, 46, 0, 0, 0, 0, 137, 154, 184, 212, 123, 137, 164, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 74, 83, 98, 191, 133, 149, 179, 102, 111, 121, 139, 17, 134, 150, 180, 252, 126, 140, 166, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 43, 48, 57, 132, 121, 136, 164, 197, 121, 135, 161, 115, 130, 146, 175, 221, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 43, 47, 52, 46, 87, 98, 118, 254, 126, 142, 170, 254, 124, 139, 166, 135, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 51, 57, 67, 118, 115, 128, 152, 170, 127, 140, 164, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      ]

    let p_imgdata = cast[ptr uint8](unsafeAddr(imgdata))
    image = ImageRGBA(16, 16, p_imgdata)
    SetHandle("LogoTecgraf", image)

  return image

proc load_medal_images() =
  let img_gold =
    [
    0'u8,0,0,4,4,4,4,4,4,4,4,4,4,0,0,0,
    0,0,4,4,4,4,4,4,4,4,4,4,4,4,0,0,
    0,0,4,4,4,4,4,4,4,4,4,4,4,4,0,0,
    0,4,4,4,4,4,4,4,4,4,4,4,4,4,4,0,
    0,4,4,4,4,4,4,4,4,4,4,4,4,4,4,0,
    0,4,4,4,4,4,4,4,4,4,4,4,4,4,4,0,
    0,4,4,4,4,4,4,4,4,4,4,4,4,4,4,0,
    0,4,4,4,4,4,4,4,4,4,4,4,4,4,4,0,
    0,3,4,4,2,4,4,4,4,4,2,2,4,4,3,0,
    2,0,2,2,2,2,2,2,2,2,2,2,2,2,0,2,
    0,0,3,3,2,2,2,1,1,2,2,2,1,3,3,0,
    0,1,1,1,3,2,1,1,1,1,2,3,3,3,3,0,
    3,3,1,1,1,3,3,3,1,3,3,1,1,1,1,1,
    3,3,1,1,1,1,1,3,3,1,1,1,1,1,1,1,
    0,0,0,0,3,1,1,0,0,1,1,1,0,0,0,0,
    0,0,0,0,0,3,3,0,0,1,1,3,0,0,0,0
    ]

  let img_silver =
    [
    0'u8,0,0,3,3,3,3,3,3,3,3,3,3,0,0,0,
    0,0,4,3,3,3,3,3,3,3,3,3,3,4,0,0,
    0,0,3,3,3,3,3,3,3,3,3,3,3,3,0,0,
    0,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0,
    0,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0,
    0,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0,
    0,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0,
    0,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0,
    0,3,3,3,3,3,3,3,3,3,3,2,3,3,3,0,
    3,0,2,2,2,2,2,3,3,2,2,2,2,2,0,3,
    0,0,1,1,2,2,1,1,1,2,2,2,1,1,3,0,
    0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,
    2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
    2,1,1,1,1,1,1,1,2,1,1,1,1,1,1,1,
    0,0,0,0,2,1,1,0,0,0,1,1,0,0,0,0,
    0,0,0,0,0,1,1,0,0,1,1,2,0,0,0,0
    ]

  let img_bronze =
    [
    0'u8,0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,
    0,0,4,1,1,1,1,1,1,1,1,1,1,4,0,0,
    0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0,
    0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,
    0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,
    0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,
    0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,
    0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,
    0,1,1,1,3,3,1,1,1,1,3,3,1,1,1,0,
    4,0,3,3,3,3,3,3,3,3,3,3,3,2,0,4,
    0,0,3,3,3,3,2,2,2,2,3,2,2,3,4,0,
    0,2,2,2,2,3,2,2,2,2,2,2,2,2,3,0,
    4,3,2,2,2,2,2,2,2,2,2,2,2,2,2,3,
    4,3,2,2,2,2,2,2,4,2,2,2,2,2,2,3,
    0,0,0,0,3,2,2,0,0,2,2,2,0,0,0,0,
    0,0,0,0,0,3,3,0,0,2,2,4,0,0,0,0
    ]

  let p_img_gold = cast[ptr uint8](unsafeAddr(img_gold))
  let image_gold = Image(16, 16, p_img_gold)
  SetAttribute(image_gold, "0", "BGCOLOR")
  SetAttribute(image_gold, "1", "128 0 0")
  SetAttribute(image_gold, "2", "128 128 0")
  SetAttribute(image_gold, "3", "255 0 0")
  SetAttribute(image_gold, "4", "255 255 0")
  SetHandle("IMGGOLD", image_gold)

  let p_img_silver = cast[ptr uint8](unsafeAddr(img_silver))
  let image_silver = Image(16, 16, p_img_silver)
  SetAttribute(image_silver, "0", "BGCOLOR")
  SetAttribute(image_silver, "1", "0 128 128")
  SetAttribute(image_silver, "2", "128 128 128")
  SetAttribute(image_silver, "3", "192 192 192")
  SetAttribute(image_silver, "4", "255 255 255")
  SetHandle("IMGSILVER", image_silver)

  let p_img_bronze = cast[ptr uint8](unsafeAddr(img_bronze))
  let image_bronze = Image(16, 16, p_img_bronze)
  SetAttribute(image_bronze, "0", "BGCOLOR")
  SetAttribute(image_bronze, "1", "128 0 0")
  SetAttribute(image_bronze, "2", "0 128 0")
  SetAttribute(image_bronze, "3", "128 128 0")
  SetAttribute(image_bronze, "4", "128 128 128")
  SetHandle("IMGBRONZE", image_bronze)

proc list_multiple_cb (self:PIhandle, t:cstring, i:int, v:int):int =
  var vstring = "deselected"
  if v != 0:
    vstring = "selected"
  echo fmt"Item {i} - {t} - {vstring}\n"
  return IUP_DEFAULT

proc dragdrop_cb(ih:PIhandle, drag_id:int, drop_id:int, shift:int, control:int):int =
  echo fmt"DRAGDROP_CB ({drag_id})->({drop_id}) shift={shift} ctrl={control}\n"
  return IUP_CONTINUE

proc mainProc =
  niupext.Open()
  ImageLibOpen()

  var
    dlg:PIhandle
    list, list_multiple, list_dropdown:PIhandle
    frm_medal, frm_sport, frm_prize:PIhandle

  SetGlobal("UTF8MODE", "Yes")

  list = List ("list_act")
  SetAttributes(list, "1=Gold, 2=Silver, 3=Bronze, 4=Tecgraf, 5=None, SHOWIMAGE=YES, SHOWDRAGDROP=YES, XXX_SPACING=4, VALUE=4".cstring)
  load_medal_images()
  SetAttribute(list, "IMAGE1", "IMGGOLD")
  SetAttribute(list, "IMAGE2", "IMGSILVER")
  SetAttribute(list, "IMAGE3", "IMGBRONZE")
  SetAttributeHandle(list, "IMAGE4", load_image_Tecgraf())
  SetCallback(list, "DRAGDROP_CB", cast[Icallback](dragdrop_cb))
  #  SetAttribute(list, "FONT", "Helvetica, Bold 40")
  #  SetAttribute(list, "AUTOHIDE", "NO")

  frm_medal = Frame (list)
  SetAttribute(frm_medal, "TITLE".cstring, "Best medal".cstring)
  list_multiple = List(nil)
  
  SetAttributes(list_multiple, "1=\"100m dash\", 2=\"Long jump\", 3=\"Javelin throw\", 4=\"110m hurdlers\", 5=\"Hammer throw\",6=\"High jump\",MULTIPLE=YES, VALUE=\"+--+--\", SIZE=EIGHTHxEIGHTH".cstring)

  SetCallback(list_multiple, "ACTION", cast[Icallback](list_multiple_cb))
  
  frm_sport = Frame (list_multiple)
  
  SetAttribute(frm_sport, "TITLE", "Competed in")

  list_dropdown = List (nil)
  SetAttributes(list_dropdown, "1=\"Less than US$ 1000\", 2=\"US$ 2000\", 3=\"US$ 5000\", 4=\"US$ 10000\", 5=\"US$ 20000\", 6=\"US$ 50000\", 7=\"More than US$ 100000\",SHOWIMAGE=YES, DROPDOWN=YES, VISIBLEITEMS=3".cstring)
  SetAttributeHandle(list_dropdown, "IMAGE1", ImageRGB(20, 20, cast[ptr uint8](unsafeAddr(image_data_24))))
  SetAttributeHandle(list_dropdown, "IMAGE2", ImageRGB(20, 20, cast[ptr uint8](unsafeAddr(image_data_24))))
  SetAttributeHandle(list_dropdown, "IMAGE3", load_image_Tecgraf())

  frm_prize = Frame (list_dropdown)
  SetAttribute(frm_prize, "TITLE", "Prizes won")

  dlg = Dialog(Hbox(frm_medal, frm_sport, frm_prize, nil))
  SetAttribute(dlg, "TITLE", "List Example")
  ShowXY(dlg, IUP_CENTER, IUP_CENTER)
  #SetAttribute(GetChild(dlg, 0), "BGCOLOR", "92 92 255")
  #SetAttribute(dlg, "BACKGROUND", "200 10 80")
  #SetAttribute(dlg, "BGCOLOR", "92 92 255")

  MainLoop()
  Close()

if isMainModule:
  mainProc()
