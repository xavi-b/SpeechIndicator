#include "speechindicator.h"
#include <QPainter>
#include <QPainterPath>
#include <QtMath>

SpeechIndicator::SpeechIndicator(QQuickItem *parent)
    : QQuickPaintedItem(parent)
{
    // By default, QQuickItem does not draw anything. If you subclass
    // QQuickItem to create a visual item, you will need to uncomment the
    // following line and re-implement updatePaintNode()

    // setFlag(ItemHasContents, true);
}

SpeechIndicator::~SpeechIndicator()
{

}

int SpeechIndicator::getPower() const
{
    return this->power;
}

void SpeechIndicator::setPower(int power)
{
    if(power < 0)
        power = 0;
    else if(power > 100)
        power = 100;

    this->power = power;

    this->update();
}

QColor SpeechIndicator::getColor() const
{
    return this->color;
}

void SpeechIndicator::setColor(QColor const& color)
{
    this->color = color;
}

void SpeechIndicator::paint(QPainter* painter)
{
    painter->setRenderHint(QPainter::Antialiasing, true);

    int halfWidth = this->width() / 2;
    int halfHeight = this->height() / 2;

    int radius = qMin(halfWidth, halfHeight) / 2;
    int halfRadius = radius / 2;
    int penWidth = 4;
    int powerPenWidth = penWidth + power * radius / 100 / 2;

    QPen powerPen(QColor(this->color.red(), this->color.green(), this->color.blue(), 255/2), powerPenWidth);
    painter->setPen(powerPen);
    QPainterPath powerPath;
    powerPath.addEllipse(halfWidth-halfRadius-powerPenWidth/2, halfHeight-halfRadius-powerPenWidth/2, radius+powerPenWidth, radius+powerPenWidth);
    painter->strokePath(powerPath, powerPen);

    QPen pen(this->color, penWidth);
    painter->setPen(pen);
    QPainterPath path;
    path.addEllipse(halfWidth-halfRadius, halfHeight-halfRadius, radius, radius);
    painter->strokePath(path, pen);
}
