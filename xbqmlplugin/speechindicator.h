#ifndef SPEECHINDICATOR_H
#define SPEECHINDICATOR_H

#include <QQuickPaintedItem>

class SpeechIndicator : public QQuickPaintedItem
{
    Q_OBJECT
    Q_PROPERTY(int power READ getPower WRITE setPower)
    Q_PROPERTY(QColor color READ getColor WRITE setColor)
    QML_ELEMENT

public:
    explicit SpeechIndicator(QQuickItem *parent = nullptr);
    ~SpeechIndicator() override;

    int getPower() const;
    void setPower(int power);

    QColor getColor() const;
    void setColor(QColor const& color);

    void paint(QPainter *painter) override;

private:
    int power = 50;
    QColor color = Qt::red;
};

#endif // SPEECHINDICATOR_H
