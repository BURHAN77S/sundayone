Students s1 = new students();
s1.firstName ='İbrahim';
s1.lastName = 'Yilmaz';
s1.classYear = 2022;
s1.Major = 'Developer';

String m1 = s1.generateReport();
system.debug(m1);

Students s2 = new students();
s2.firstName ='Ahmet';
s2.lastName = 'Sahiner';
s2.classYear = 2022;
s2.Major = 'Administrator';

String m2 = s2.generateReport();
system.debug(m2);