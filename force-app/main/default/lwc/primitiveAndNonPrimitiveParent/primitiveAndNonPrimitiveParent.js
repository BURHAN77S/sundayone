import { LightningElement } from 'lwc';

export default class PrimitiveAndNonPrimitiveParent extends LightningElement {
    //Parantte bulunan ülke ve şehirlerinin listesini child component araciligiyla yazalım.. c/addressGetRecord.c/calculatorSunday
    country1="United State";
    country2="Turkey";
    country3="Nederland";

    cities1=[
    "New York",
    "Texas",
    "Stlois",
    "Ohio",
    "Chicago"
    ];
    cities2=[
        "Ordu",
        "Ankara",
        "Izmir",
        "Isparta",
        "Hatay",
        "Kahramanmaras"
        ];
    cities3=[
        "Tilburg",
        "Rotterdam",
        "Amsterdam",
        "Eindhoven",
        "Groningen"
        ];
}