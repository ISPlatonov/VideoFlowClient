import QtQuick 2.12

ListModel {
    id: source

    ListElement {
        name: "biba"
        address: "https://track.miem.hse.ru/project/ps/us/136"
        cover: "covers/biba.png"
        is_recording: false
        rec_id: 0
    }
    ListElement {
        name: "boba"
        address: "https://doc.qt.io/qt-5/qtquick-modelviewsdata-modelview.html"
        cover: "covers/boba.png"
        is_recording: false
        rec_id: 0
    }
}
