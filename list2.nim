#  IupList: Example in C
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

    let p_imgdata = cast[ptr cuchar](unsafeAddr(imgdata))
    image = ImageRGBA(32, 32, p_imgdata)
    discard SetHandle("Tecgraf", image)

  return image

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

    let p_imgdata = cast[ptr cuchar](unsafeAddr(imgdata))
    image = ImageRGBA(16, 16, p_imgdata)
    discard SetHandle("LogoTecgraf", image)

  return image

proc load_image_Test():PIhandle =
  let imgdata =
    [
    5'u8,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,
    5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5,
    5,0,1,1,1,1,1,1,2,2,2,2,2,2,0,5, 
    5,0,1,1,1,1,1,1,2,2,2,2,2,2,0,5, 
    5,0,1,1,1,1,1,1,2,2,2,2,2,2,0,5, 
    5,0,1,1,1,1,1,1,2,2,2,2,2,2,0,5, 
    5,0,1,1,1,1,1,1,2,2,2,2,2,2,0,5, 
    5,0,1,1,1,1,1,1,2,2,2,2,2,2,0,5, 
    5,0,3,3,3,3,3,3,4,4,4,4,4,4,0,5, 
    5,0,3,3,3,3,3,3,4,4,4,4,4,4,0,5, 
    5,0,3,3,3,3,3,3,4,4,4,4,4,4,0,5, 
    5,0,3,3,3,3,3,3,4,4,4,4,4,4,0,5, 
    5,0,3,3,3,3,3,3,4,4,4,4,4,4,0,5, 
    5,0,3,3,3,3,3,3,4,4,4,4,4,4,0,5,
    5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5,
    5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5
    ]

  let p_imgdata = cast[ptr cuchar](unsafeAddr(imgdata))
  let image = Image(16, 16, p_imgdata)
  SetAttribute(image, "0", "BGCOLOR")
  SetAttribute(image, "1", "255 0 0")
  SetAttribute(image, "2", "0 255 0")
  SetAttribute(image, "3", "0 0 255")
  SetAttribute(image, "4", "255 255 255")
  SetAttribute(image, "5", "0 0 0")
  return image

proc list_cb(self:PIhandle, t:cstring, i:int, v:int):int =
  let lbl = cast[PIhandle](GetAttribute(self, "_LABEL"))
  StoreAttribute(lbl, "TITLE", t)
  return IUP_DEFAULT

proc edit_cb(self:PIhandle, c:int, after:cstring):int =
  let lbl = cast[PIhandle](GetAttribute(self, "_LABEL"))
  if c == 0:
    return IUP_DEFAULT
  StoreAttribute(lbl, "TITLE", after)
  return IUP_DEFAULT

proc btclose_cb(self:PIhandle):int =
  return IUP_CLOSE

proc bt_cb(self:PIhandle):int =
  let list = cast[PIhandle](GetAttribute(self, "_LIST"))
  Messagef("List", "Value=%s", GetAttribute(list, "VALUE"))
  return IUP_DEFAULT

proc getfocus_cb(self:PIhandle):int =
  let bt = cast[PIhandle](GetAttribute(self, "_BUTTON"))
  SetAttribute(bt, "BGCOLOR", "255 0 128")
  return IUP_DEFAULT

proc killfocus_cb(self:PIhandle):int =
  let bt = cast[PIhandle](GetAttribute(self, "_BUTTON"))
  SetAttribute(bt, "BGCOLOR", nil)
  return IUP_DEFAULT

proc testDropData_cb(self:PIhandle, `type`:cstring, data:cstring, len, x, y:int):int =
  # Data is a text for this sample, so we can print it
  let att = GetAttribute(self, "NAME")
  echo fmt"\n  DROPDATA_CB(ih={att}, type={`type`}, data={data}, size={len}, x={x}, y={y})\n\n"
  return IUP_DEFAULT

proc testDropMotion_cb(self:PIhandle, x, y:int, status:cstring):int =
  let att = GetAttribute(self, "NAME")
  echo fmt"  DROPMOTION_CB(ih={att}, X={x}, Y={y}, status={status})\n"
  return IUP_DEFAULT

proc testDragEnd_cb(self:PIhandle, del:int):int =
  let att = GetAttribute(self, "NAME")
  echo fmt"DRAGEND_CB(ih={att}, remove={del})\n" #finishing
  return IUP_DEFAULT

proc testDragData_cb(self:PIhandle, `type`:cstring, data:var cstring, len:int):int =
  let att = GetAttribute(self, "NAME")
  echo fmt"  DRAGDATA_CB(ih={att}, type={`type`}, len={len})\n"
  # fill data with something
  ##sprintf(data, "Drag Text Test Sample");
  data = "Drag Text Test Sample"
  return IUP_DEFAULT

proc testDragDataSize_cb(self:PIhandle, `type`:cstring):int =
  let att = GetAttribute(self, "NAME")
  echo fmt"  DRAGDATASIZE_CB(ih={att}, type={`type`})\n"
  return 22  # return the size of the data to be dragged

proc testDragBegin_cb(self:PIhandle, x, y:int):int =
  let att = GetAttribute(self, "NAME")
  echo fmt"DRAGBEGIN_CB(ih={att}, x={x}, y={y})\n"
  return IUP_DEFAULT

proc mainProc =
  niupext.Open()
  ImageLibOpen()

  var dlg, list1, list2, list3, list4,
                box1, box2, box3, box4, lbl,
                bt1, bt2, bt3, bt4, btok, btcancel, txt1, txt2:PIhandle

  bt1 = Button("(1)Drop+Edit", nil)
  discard SetCallback(bt1, "ACTION", cast[Icallback](bt_cb))
  bt2 = Button("(2)Drop", nil)
  discard SetCallback(bt2, "ACTION", cast[Icallback](bt_cb))
  bt3 = Button("(3)List+Edit", nil)
  discard SetCallback(bt3, "ACTION", cast[Icallback](bt_cb))
  bt4 = Button("(4)List", nil)
  discard SetCallback(bt4, "ACTION", cast[Icallback](bt_cb))

  list1 = List(nil)
  discard SetCallback(list1, "ACTION", cast[Icallback](list_cb))
  list2 = List(nil)
  discard SetCallback(list2, "ACTION", cast[Icallback](list_cb))
  list3 = List(nil)
  discard SetCallback(list3, "ACTION", cast[Icallback](list_cb))
  list4 = List(nil)
  discard SetCallback(list4, "ACTION", cast[Icallback](list_cb))

  discard SetAttributes(list1, "1=\"US$ 1000\", 2=\"US$ 2000\", 3=\"US$ 30000000\", 4=\"US$ 4000\", 5=\"US$ 5000\", 6=\"US$ 6000\", 7=\"US$ 7000\",EXPAND=HORIZONTAL, EDITBOX=YES, DROPDOWN=YES, VISIBLEITEMS=5, SHOWIMAGE=YES")
  SetAttributeHandle(list1, "IMAGE1", load_image_LogoTecgraf())
  SetAttributeHandle(list1, "IMAGE2", load_image_LogoTecgraf())
  SetAttributeHandle(list1, "IMAGE3", load_image_Tecgraf())
  SetAttributeHandle(list1, "IMAGE4", load_image_LogoTecgraf())

  discard SetAttributes(list2, "1=\"R$ 1000\", 2=\"R$ 2000\", 3=\"R$ 3000\", 4=\"R$ 4000\", 5=\"R$ 5000\", 6=\"R$ 6000\", 7=\"R$ 7000\",EXPAND=HORIZONTAL, DROPDOWN=YES, VISIBLEITEMS=5, SHOWIMAGE=YES")
  SetAttributeHandle(list2, "IMAGE1", load_image_LogoTecgraf())
  SetAttributeHandle(list2, "IMAGE2", load_image_LogoTecgraf())
  SetAttributeHandle(list2, "IMAGE3", load_image_Tecgraf())
  SetAttributeHandle(list2, "IMAGE4", load_image_LogoTecgraf())

  discard SetAttributes(list3, "1=\"Char A\", 2=\"Char B\", 3=\"Char CCCCC\", 4=\"Char D\", 5=\"Char F\", 6=\"Char G\", 7=\"Char H\",EXPAND=YES, EDITBOX=YES, XXX_SPACING=4, SHOWIMAGE=YES")
  SetAttributeHandle(list3, "IMAGE1", load_image_Test())
  #SetAttributeHandle(list3, "IMAGE3", load_image_Test())
  SetAttributeHandle(list3, "IMAGE5", load_image_Test())
  SetAttributeHandle(list3, "IMAGE7", load_image_Test())
  SetAttributeHandle(list1, "IMAGE3", load_image_Tecgraf())

  discard SetAttributes(list4, "1=\"Number 1\", 2=\"Number 2\", 3=\"Number 3\", 4=\"Number 4\", 5=\"Number 5\", 6=\"Number 6\", 7=\"Number 7\",EXPAND=YES")

  # DRAG AND DROP TESTS ////////////////////////////////////
  SetAttribute(list1, "DROPTARGET", "YES")
  SetAttribute(list1, "DROPTYPES", "TEXT,STRING")
  discard SetCallback(list1, "DROPDATA_CB", cast[Icallback](testDropData_cb))
  discard SetCallback(list1, "DROPMOTION_CB", cast[Icallback](testDropMotion_cb))
  SetAttribute(list1, "NAME", "list1")

  SetAttribute(list2, "DROPTARGET", "YES")
  SetAttribute(list2, "DROPTYPES", "TEXT,STRING")
  discard SetCallback(list2, "DROPDATA_CB", cast[Icallback](testDropData_cb))
  discard SetCallback(list2, "DROPMOTION_CB", cast[Icallback](testDropMotion_cb))
  SetAttribute(list2, "NAME", "list2")

  SetAttribute(list3, "DROPTARGET", "YES")
  SetAttribute(list3, "DROPTYPES", "STRING")
  discard SetCallback(list3, "DROPDATA_CB", cast[Icallback](testDropData_cb))
  discard SetCallback(list3, "DROPMOTION_CB", cast[Icallback](testDropMotion_cb))
  SetAttribute(list3, "NAME", "list3")

  SetAttribute(list4, "DRAGSOURCE", "YES")
  SetAttribute(list4, "DRAGTYPES", "TEXT")
  discard SetCallback(list4, "DRAGBEGIN_CB", cast[Icallback](testDragBegin_cb))
  discard SetCallback(list4, "DRAGDATASIZE_CB",  cast[Icallback](testDragDataSize_cb))
  discard SetCallback(list4, "DRAGDATA_CB",  cast[Icallback](testDragData_cb))
  discard SetCallback(list4, "DRAGEND_CB",   cast[Icallback](testDragEnd_cb))
  SetAttribute(list4,"DRAGCURSOR", "Tecgraf")
  SetAttribute(list4, "NAME", "list4")

  txt1 = Text(nil)
  SetAttribute(txt1, "MULTILINE", "YES")
  SetAttribute(txt1, "RASTERSIZE", "150x90")
  SetAttribute(txt1, "VALUE", "Drop Text Here")
  SetAttribute(txt1, "DROPTARGET", "YES")
  SetAttribute(txt1, "DROPTYPES", "TEXT")
  discard SetCallback(txt1, "DROPDATA_CB", cast[Icallback](testDropData_cb))
  discard SetCallback(txt1, "DROPMOTION_CB", cast[Icallback](testDropMotion_cb))
  SetAttribute(txt1, "NAME", "txt1")

  txt2 = Text(nil)
  SetAttribute(txt2, "MULTILINE", "YES")
  SetAttribute(txt2, "RASTERSIZE", "150x90")
  SetAttribute(txt2, "VALUE", "Drag Text From Here")
  SetAttribute(txt2, "DRAGSOURCE", "YES")
  SetAttribute(txt2, "DRAGTYPES", "TEXT,STRING")
  SetAttribute(txt2, "DRAGSOURCEMOVE", "Yes")
  discard SetCallback(txt2, "DRAGBEGIN_CB", cast[Icallback](testDragBegin_cb))
  discard SetCallback(txt2, "DRAGDATASIZE_CB",  cast[Icallback](testDragDataSize_cb))
  discard SetCallback(txt2, "DRAGDATA_CB",  cast[Icallback](testDragData_cb))
  discard SetCallback(txt2, "DRAGEND_CB",   cast[Icallback](testDragEnd_cb))
  SetAttribute(txt2, "NAME", "txt2")

  #////////////////////////////////////////////////////////

  SetAttribute(bt1, "_LIST", cast[cstring](list1))
  SetAttribute(bt2, "_LIST", cast[cstring](list2))
  SetAttribute(bt3, "_LIST", cast[cstring](list3))
  SetAttribute(bt4, "_LIST", cast[cstring](list4))

  SetAttribute(list1, "_BUTTON", cast[cstring](bt1))
  SetAttribute(list2, "_BUTTON", cast[cstring](bt2))
  SetAttribute(list3, "_BUTTON", cast[cstring](bt3))
  SetAttribute(list4, "_BUTTON", cast[cstring](bt4))

  SetAttribute(bt1, "BGCOLOR", "192 192 192")
  SetAttribute(bt2, "BGCOLOR", "192 192 192")
  SetAttribute(bt3, "BGCOLOR", "192 192 192")
  SetAttribute(bt4, "BGCOLOR", "192 192 192")

  discard SetCallback(list1, "GETFOCUS_CB",  cast[Icallback](getfocus_cb))
  discard SetCallback(list1, "KILLFOCUS_CB", cast[Icallback](killfocus_cb))
  discard SetCallback(list2, "GETFOCUS_CB",  cast[Icallback](getfocus_cb))
  discard SetCallback(list2, "KILLFOCUS_CB", cast[Icallback](killfocus_cb))
  discard SetCallback(list3, "GETFOCUS_CB",  cast[Icallback](getfocus_cb))
  discard SetCallback(list3, "KILLFOCUS_CB", cast[Icallback](killfocus_cb))
  discard SetCallback(list4, "GETFOCUS_CB",  cast[Icallback](getfocus_cb))
  discard SetCallback(list4, "KILLFOCUS_CB", cast[Icallback](killfocus_cb))

  discard SetCallback(list1, "EDIT_CB", cast[Icallback](edit_cb))
  discard SetCallback(list3, "EDIT_CB", cast[Icallback](edit_cb))

  #  SetAttribute(list3, "READONLY", "YES")

  box1 = Vbox(list1, bt1, txt1, txt2, nil)
  box2 = Vbox(list2, bt2, nil)
  box3 = Vbox(list3, bt3, nil)
  box4 = Vbox(list4, bt4, nil)

  lbl = Label("")
  SetAttribute(lbl, "EXPAND", "HORIZONTAL")

  btok = Button("OK", nil)
  discard SetCallback(btok, "ACTION", cast[Icallback](btclose_cb))
  discard SetHandle("btok", btok)
  btcancel = Button("Cancel", "btclose_cb")
  discard SetCallback(btcancel, "ACTION", cast[Icallback](btclose_cb))
  discard SetHandle("btcancel", btcancel)

  SetAttribute(btok, "_LIST1", cast[cstring](list1))
  SetAttribute(btok, "_LIST2", cast[cstring](list2))
  SetAttribute(btok, "_LIST3", cast[cstring](list3))
  SetAttribute(btok, "_LIST4", cast[cstring](list4))
           
  dlg = Dialog(SetAttributes(Vbox(Hbox(box1, box2, box3, box4, nil), lbl, btok, btcancel, nil),"MARGIN=10x10, GAP=10"))
  SetAttribute(dlg, "TITLE", "List Example")
  SetAttribute(dlg, "_LABEL", cast[cstring](lbl))
  SetAttribute(dlg, "DEFAULTENTER", "btok")
  SetAttribute(dlg, "DEFAULTESC", "btcancel")
  #  SetAttribute(GetChild(dlg, 0), "BGCOLOR", "92 92 255")
  #  SetAttribute(dlg, "BACKGROUND", "200 10 80")
  #  SetAttribute(dlg, "BGCOLOR", "92 92 255")

  discard ShowXY(dlg, IUP_CENTER, IUP_CENTER)

  discard MainLoop()
  Close()

if isMainModule:
  mainProc()

# DnD tests:
#  (4) From list4/txt2 to list3/txt1
#  (4) From/To another instance of the same aplication
#  (4) From/To another application

