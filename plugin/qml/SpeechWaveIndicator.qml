import QtQuick 2.15

Item {
    property var color: "green"
    property var power: 50

    onPowerChanged: {
        canvas.requestPaint();
    }

    Canvas {
        id: canvas
        anchors.fill: parent

        onPaint: {
            var w = width;
            var h = height ;
            var amplitude = h * power / 100;
            var frequency = 5 * 2 * Math.PI / w;

            var ctx = getContext("2d");
            ctx.strokeStyle = color;
            ctx.lineWidth = 4;
            ctx.clearRect(0, 0, w, h);
            ctx.beginPath();
            ctx.moveTo(0, h / 2);
            for (var x = - w / 2; x < w / 2; x++) {
                var y = - Math.exp(-x*x*frequency/w) * Math.cos(x * frequency) * amplitude / 4 + h / 2;
                ctx.lineTo(x + w / 2, y);
            }
            ctx.stroke();
        }
    }
}
