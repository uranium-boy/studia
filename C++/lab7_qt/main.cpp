#include <qapplication.h>
#include <qnamespace.h>
#include <qwidget.h>
#include <qlabel.h>
#include <qpushbutton.h>

int main(int argc, char *argv[]) {
    QApplication app(argc, argv);

    QWidget window;
    window.setWindowTitle("Let me die");
    window.resize(400, 300);

    QLabel *label = new QLabel("Goobye, World!", &window);
    label->setAlignment(Qt::AlignCenter);

    QPushButton *button = new QPushButton("Kill me", &window);

    window.show();

    return app.exec();
}
