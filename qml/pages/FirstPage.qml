import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.XmlListModel 2.0

Page {
    id: page
    property var city: "Moscow"
    XmlListModel {
        id: xmlmodel
        source: "http://api.weatherapi.com/v1/forecast.xml?key=0d0d9b8ddd234ab4868153428221201&lang=ru&q=" + city+"&days=3"
        query: "/root"
        XmlRole { name: "temp_c"; query: "current/temp_c/string()"; }
        XmlRole { name: "cond"; query: "current/condition/text/string()"; }
        XmlRole { name: "pic"; query: "current/condition/icon/string()"; }
        XmlRole { name: "wind"; query: "current/wind_kph/string()"; }
        XmlRole { name: "feel"; query: "current/feelslike_c/string()"; }

        XmlRole { name: "day1_max"; query: "forecast/forecastday[1]/day/maxtemp_c/string()";}
        XmlRole { name: "day1_min"; query: "forecast/forecastday[1]/day/mintemp_c/string()";}
        XmlRole { name: "day1_cond"; query: "forecast/forecastday[1]/day/condition/text/string()";}
        XmlRole { name: "day1_pic"; query: "forecast/forecastday[1]/day/condition/icon/string()";}

        XmlRole { name: "day2_max"; query: "forecast/forecastday[2]/day/maxtemp_c/string()";}
        XmlRole { name: "day2_min"; query: "forecast/forecastday[2]/day/mintemp_c/string()";}
        XmlRole { name: "day2_cond"; query: "forecast/forecastday[2]/day/condition/text/string()";}
        XmlRole { name: "day2_pic"; query: "forecast/forecastday[2]/day/condition/icon/string()";}

        XmlRole { name: "day3_max"; query: "forecast/forecastday[3]/day/maxtemp_c/string()";}
        XmlRole { name: "day3_min"; query: "forecast/forecastday[3]/day/mintemp_c/string()";}
        XmlRole { name: "day3_cond"; query: "forecast/forecastday[3]/day/condition/text/string()";}
        XmlRole { name: "day3_pic"; query: "forecast/forecastday[3]/day/condition/icon/string()";}
    }

    SilicaListView {      
        anchors.fill: parent
        model: xmlmodel
        delegate: Column {
            x: 10
            width: parent.width - 2 * x
            Label {
                x:98
                width: parent.width; wrapMode: Text.WordWrap; text: temp_c +" ℃"
            font.pixelSize: 150
                Image {
                    y:-30
                    x:370
                    width: 250
                    height:250
                    source: "http:"+pic.replace("64x64", "128x128")

              }
            }

            Label { width: parent.width; wrapMode: Text.WordWrap; text:"Скорость ветра: "+ wind+" км/ч" }
            Label { width: parent.width; wrapMode: Text.WordWrap; text:"Ощущается как: "+ feel+" ℃" }
            Label { width: parent.width; wrapMode: Text.WordWrap; text:cond }
            TextField{
                id:txt
                text:city
            }

            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Ok"
                onClicked: {
                    city =txt.text
                }

            }
            Label{text:" "}
             Label {
                 font.pixelSize: 30
                 width: parent.width; wrapMode: Text.WordWrap; text:"Сегодня: "+ day1_min + " / " + day1_max +" ℃"
                 Image {
                     source: "http:"+day1_pic
                     x:620
                 }}
             Label{
                 font.pixelSize: 30
                 width: parent.width; wrapMode: Text.WordWrap; text:day1_cond

             }

             Label {
                 font.pixelSize: 30
                 width: parent.width; wrapMode: Text.WordWrap; text:"Завтра: "+ day2_min + " / " + day2_max +" ℃"
             Image {
                 source: "http:"+day2_pic
                 x:620
             }
             }
             Label{
                 font.pixelSize: 30
                 width: parent.width; wrapMode: Text.WordWrap; text:day2_cond

             }

             Label {
                 font.pixelSize: 30
                 width: parent.width; wrapMode: Text.WordWrap; text:"Послезавтра: "+ day3_min + " / " + day3_max +" ℃"
             Image {
                 source: "http:"+day3_pic
                 x:620
             }
             }
             Label{
                 font.pixelSize: 30
                 width: parent.width; wrapMode: Text.WordWrap; text:day3_cond

             }
        }
    }
}
