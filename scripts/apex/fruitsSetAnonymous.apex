/*In a new anonymous apex file, create a Set named as fruitsSet, store at least 4 fruits name in it.
a. Print fruits name from fruitsSet one by one.
b. Print the size of the fruitsSet.
c. Add a fruit name “Apricot” to the fruitsSet and print the fruitsSet.
d. Check if the fruitsSet contains the fruit ‘Apricot’
e. Check if the fruitsSet is empty?*/

Set<String>fruits = new Set<String>{'banana','apple','grape','pear'};
for (String eachFruits : fruits){
    System.debug(eachFruits); 
}

Integer fruitSize = fruits.size();
System.debug('Meyve sayısı ->'+ fruitSize);

fruits.add('Appricot');
System.debug(fruits);

Boolean checkFruits = fruits.contains('Appricot');
System.debug(checkFruits);

Boolean checkEmpty = fruits.isEmpty();
System.debug(checkEmpty);