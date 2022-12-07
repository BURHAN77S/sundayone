/*List Creation and List Class Methods
In a new anonymous apex file, create a List named as coloursList, store at least 5 color Names in
it, and print it.
a. Print the size of the above-created List.
b. Check if the coloursList contains ‘Red’ color in it or not.
c. Retrieve the last element of the List and print it in the upper case.
d. Make the fourth element in the List as Upper case.
e. Create a different List named colourCodesList in which we need to store some color
codes. For example: ‘#FF0000’ is code for red color.
f. Compare if the two lists colourCodesList and coloursList are equal or not.
g. Merge the two Lists (colourCodesList, coloursList) and print the newly created list.*/

List<string> colorsList = new List<string>();
colorsList.add('mavi');
colorsList.add('kırmızı');
colorsList.add('beyaz');
colorsList.add('siyah');
colorsList.add('mor');
system.debug('Renkler ->'+colorsList);

Integer colorSize = colorsList.size();
System.debug('Eleman sayısı ->'+ colorsList.size());

Boolean checkcolor = colorsList.contains('Red');
System.debug('Red var mı? ->'+ checkcolor);

String getLast = colorsList.get(colorsize-1).toUpperCase();
System.debug('Son elemanı ve büyük harf ->'+ getLast);

String getFourth=colorsList.get(3).toUpperCase();
System.debug('Dördüncü elemanı ve büyük harf ->'+ getFourth);

List<string> colorsCodesList = new List<string>();
colorsCodesList.add('#0000FF');
colorsCodesList.add('#FF0000');
colorsCodesList.add('#FFFFF');
colorsCodesList.add('#000000');
colorsCodesList.add('#000080');

Boolean isEqualList = colorsList.equals(colorsCodesList);
System.debug(isEqualList);

List<String> mergeColorList = new List<String>();
mergeColorList.addAll(colorsList);
System.debug(mergeColorList);
mergeColorList.addAll(colorsCodesList);
System.debug('New color list = '+ mergeColorList);