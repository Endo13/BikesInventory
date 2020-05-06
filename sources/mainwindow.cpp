#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QFile>
#include <QFileDialog>
#include <QDir>
#include <QMessageBox>
#include <QDebug>
#include <QStyleFactory>

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

	// set style
	qApp->setStyle(QStyleFactory::create("Fusion"));
	// increase font size for better reading
	QFont defaultFont = QApplication::font();
	defaultFont.setPointSize(defaultFont.pointSize() + 2);
	qApp->setFont(defaultFont);
	// modify palette to dark
	QPalette darkPalette;
	darkPalette.setColor(QPalette::Window, QColor(53, 53, 53));
	darkPalette.setColor(QPalette::WindowText, Qt::white);
	darkPalette.setColor(QPalette::Disabled, QPalette::WindowText, QColor(127, 127, 127));
	darkPalette.setColor(QPalette::Base, QColor(42, 42, 42));
	darkPalette.setColor(QPalette::AlternateBase, QColor(66, 66, 66));
	darkPalette.setColor(QPalette::ToolTipBase, Qt::white);
	darkPalette.setColor(QPalette::ToolTipText, Qt::white);
	darkPalette.setColor(QPalette::Text, Qt::white);
	darkPalette.setColor(QPalette::Disabled, QPalette::Text, QColor(127, 127, 127));
	darkPalette.setColor(QPalette::Dark, QColor(35, 35, 35));
	darkPalette.setColor(QPalette::Shadow, QColor(20, 20, 20));
	darkPalette.setColor(QPalette::Button, QColor(53, 53, 53));
	darkPalette.setColor(QPalette::ButtonText, Qt::white);
	darkPalette.setColor(QPalette::Disabled, QPalette::ButtonText, QColor(127, 127, 127));
	darkPalette.setColor(QPalette::BrightText, Qt::red);
	darkPalette.setColor(QPalette::Link, QColor(42, 130, 218));
	darkPalette.setColor(QPalette::Highlight, QColor(42, 130, 218));
	darkPalette.setColor(QPalette::Disabled, QPalette::Highlight, QColor(80, 80, 80));
	darkPalette.setColor(QPalette::HighlightedText, Qt::white);
	darkPalette.setColor(QPalette::Disabled, QPalette::HighlightedText, QColor(127, 127, 127));
	qApp->setPalette(darkPalette);

	connect(ui->pbAddGear, SIGNAL(clicked()), SLOT(on_actionAddGear_triggered()));
	connect(ui->pbShowGear, SIGNAL(clicked()), SLOT(on_actionShowGear_triggered()));

    setupDatabase();
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::setupDatabase()
{
    /// searches for the database file
    /// if it finds it then connect to it
    /// otherwise open a file dialog and ask the user to locate the file
    db = QSqlDatabase::addDatabase("QSQLITE");
    QString path = qApp->applicationDirPath()+"/records/data.db";
    QFile dbFile(path);
    if(!dbFile.exists()){
        QMessageBox::StandardButton reply;
        reply = QMessageBox::question(this,"Database","No database Exists."
                                              "Do you want to open your own database?",
                              QMessageBox::Yes | QMessageBox::No);
        if(reply==QMessageBox::Yes)
            path = QFileDialog::getOpenFileName(this,"Database",QDir::currentPath());
        else{
            qApp->closeAllWindows();
            qApp->exit(0);
        }
    }
    db.setDatabaseName(path);
    qDebug() << path;
    if(db.open())
        ui->status->setText("Database Connected");
    else
        ui->status->setText("Database not connected");
}

void MainWindow::on_actionAddGear_triggered()
{
    GearsDialog* gearsDialog = new GearsDialog(&db, this);
	gearsDialog->setAttribute(Qt::WA_DeleteOnClose);
	gearsDialog->setModal(true);
	gearsDialog->exec();
}

void MainWindow::on_actionShowGear_triggered()
{
	GearsView* gearsView  = new GearsView(&db, this);
	gearsView->setAttribute(Qt::WA_DeleteOnClose);
	gearsView->setModal(true);
	gearsView->exec();
}

