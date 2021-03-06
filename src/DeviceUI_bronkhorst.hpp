 #ifndef DEVICEUI_BRONKHORST_HPP
#define DEVICEUI_BRONKHORST_HPP

#include <Wt/WApplication>
#include <Wt/WBreak>
#include <Wt/WContainerWidget>
#include <Wt/WLineEdit>
#include <Wt/WLabel>
#include <Wt/WPushButton>
#include <Wt/WText>
#include <Wt/WTextArea>
#include <Wt/WTabWidget>
#include <Wt/WMenuItem>
#include <Wt/WEnvironment>
#include <Wt/WVBoxLayout>
#include <Wt/WHBoxLayout>
#include <Wt/WBootstrapTheme>
#include <Wt/WCssTheme>
#include <Wt/WImage>
#include <Wt/WServer>
#include <Wt/WIOService>
#include <Wt/Chart/WCartesianChart>
#include <Wt/Chart/WDataSeries>
#include <Wt/WDoubleSpinBox>
#include <Wt/WAbstractItemModel>
#include <Wt/WAbstractItemView>
#include <Wt/WDate>
#include <Wt/WDateTime>
#include <Wt/WLocalDateTime>
#include <Wt/WPaintedWidget>
#include <Wt/WItemDelegate>
#include <Wt/WShadow>
#include <Wt/WStandardItemModel>
#include <Wt/WTableView>
#include <Wt/WTimer>
#include <Wt/WToolBar>
#include <Wt/Dbo/Dbo>
#include <Wt/Dbo/backend/Sqlite3>
#include <Wt/Dbo/QueryModel>
#include <Wt/Dbo/WtSqlTraits>
#include <functional>
#include "measuredValue.hpp"
#include "measuredDBValue.hpp"
#include "jobQueue.hpp"
#include "bronkhorst.hpp"
#include "DeviceUI.hpp"
#include "basicUIElements.hpp"


namespace lughos

{

 template <> class DeviceUI<bronkhorst> : public DeviceUIInterface
  {
  protected:

    boost::shared_ptr<bronkhorst> horst;
    Wt::WLineEdit* stateF1;
    Wt::WLineEdit* flowF1;
    Wt::WLabel* stateL1;
    Wt::WLabel* flowL1;
    Wt::WLabel* flowL2;
    Wt::WLineEdit *flowMeasurementField1;
    Wt::WPushButton * stateB1;
    ui::Setting<Wt::WDoubleSpinBox>* setpoint;

    boost::shared_ptr<Wt::Dbo::Session> session;
//     dbo::backend::Sqlite3 dbBackend;
    
    
    
  public:
    
    DeviceUI< bronkhorst >(boost::shared_ptr<Device> horst) : horst(boost::dynamic_pointer_cast<bronkhorst>(horst))
    {
      this->init();
    }
    
    DeviceUI<bronkhorst>(boost::shared_ptr<bronkhorst> horst) : horst(horst)
    {
      this->init();
    }
    
    void checkConnected()
    {
      if(horst->isConnected())
      {
	this->stateF1->setText("Connected!");
        this->stateB1->setText("Status");
        this->setpoint->field()->setMaximum(this->horst->getMaxCapacity());
	this->setpoint->field()->setMinimum(0);
// 	this->startB->setDisabled(false);
// 	this->stopB->setDisabled(false);
// 	this->startB->clicked().connect(this,&DeviceUI<coolpak6000>::start);
// 	this->stopB->clicked().connect(this,&DeviceUI<coolpak6000>::stop);
	this->setpoint->setDisabled(false);
        this->setpoint->button()->clicked().connect(this,&DeviceUI<bronkhorst>::setFlow);
	this->stateB1->clicked().connect(this,&DeviceUI<bronkhorst>::getState);
	this->getState();

      }
      else
      {
	this->stateF1->setText("Not connected!");
// 	this->stateF->setText(std::to_string(coolpak->isConnected()));
        this->stateB1->setText("Try again");
 	this->stateB1->clicked().connect(this,&DeviceUI<bronkhorst>::checkConnected);
// 	this->startB->setDisabled(true);
// 	this->stopB->setDisabled(true);

      }
    }
  
      void init()
    {
      std::cout << "Brankhorst init running..." << std::endl;
     this->name=horst->getName();
//      this->setWidth(500);
     this->setTitle(Wt::WString::fromUTF8(this->name.c_str()));
     this->stateF1 = new Wt::WLineEdit("Initializing...");
     this->stateF1->setReadOnly(true);
     this->stateL1 = new Wt::WLabel("Status:");
     this->flowL1 = new Wt::WLabel("Set Flow:");
     this->stateL1->setBuddy(stateF1);
     this->setpoint =  new  ui::Setting<Wt::WDoubleSpinBox>();
     this->stateB1 = new Wt::WPushButton("Status");
     this->flowL2 = new Wt::WLabel("Measured Flow:");
     this->flowMeasurementField1 = new Wt::WLineEdit("0.0");
     this->flowMeasurementField1->setDisabled(true);
     this->addWidget(stateL1);
     this->addWidget(stateF1);
     this->addWidget(flowL2);
     this->addWidget(flowMeasurementField1);
     this->addWidget(flowL1);
     this->addWidget(setpoint);
     this->addWidget(stateB1);
     this->setpoint->setDisabled(true);
     this->checkConnected();

    }
    
     
    void setFlow()
    {
//       
      stringstream sstr; 
      string str = setpoint->field()->text().toUTF8(); 
      float f = lughos::save_lexical_cast<float>(str,0.0);
      this->stateF1->setText(std::string("Flow set: ")+ std::to_string(f));
      this->getSetpoint();
      this->getFlow();
//     
      
    }
    
    void getState()
    {
      this->getSetpoint();
      this->getFlow();

    }
    
    void setFlow(boost::shared_ptr<bronkhorst> horst)
    {
//       
      stringstream sstr; 
      string str = setpoint->field()->text().toUTF8(); 
      float f; 
      sstr<<str; 
      sstr>>f;

      this->stateF1->setText("Flow set:"+setpoint->field()->text().toUTF8());
      this->getSetpoint();
      this->getFlow();
//     
      
    }
    
    void getSetpoint()
    {
      measuredValue<double> v = horst->get_setpoint();
      this->setpoint->field()->setText(std::string(v.getValueAsString()));
    }
    
    void getFlow()
    {
      measuredValue<double> v = horst->get_flow();
      this->flowMeasurementField1->setText(std::string(v.getValueAsString()));
    }
    
    void start()
    {

    }
    
    void stop()
    {

    }
    
    
    
  };
} //namespace lughos
 #endif 
  