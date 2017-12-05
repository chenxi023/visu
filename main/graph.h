#ifndef GRAPH_H
#define GRAPH_H

#include <QQuickItem>

class Graph : public QQuickItem
{
    Q_OBJECT
public:
    Graph();

protected:
    QSGNode *updatePaintNode(QSGNode *, UpdatePaintNodeData *);
    void geometryChanged(const QRectF &newGeometry, const QRectF &oldGeometry);

public slots:
    void appendSample(qreal obj,qreal value);
    void removeFirstSample();

private:
    QList<qreal> m_samples;
    qreal m_obj;

    bool m_samplesChanged;
    bool m_geometryChanged;
};

#endif // GRAPH_H
