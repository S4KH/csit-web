<?php
class Admin_Form_AnnForm extends Zend_Form{
    public function __construct($option = null){
        parent::__construct($option);
        $this->setName('Add_ann');                    
        $date = new Zend_Form_Element_Text('edate');
        $date->setLabel('Date Time:')
             ->addValidator('NotEmpty');              
        $lesson = new Zend_Form_Element_Text('lessonname');
        $teacher = new Zend_Form_Element_Text('teachers');
        $etime = new Zend_Form_Element_Text('etime');              
        $rno = new Zend_Form_Element_Text('rno');
        $clas = new Zend_Form_Element_Text('classes');
        $rno->setLabel('Where')
            ->addValidator('NotEmpty')
            ->setRequired();
        $add = new Zend_Form_Element_Submit('add');
        $add->setLabel('Add')
            ->class = "btn btn-info";
            
        $id = new Zend_Form_Element_Hidden('id');
        $id->removeDecorator('label');
        $this->addElements(array($date, $etime,  $lesson, $rno, $clas, $add, $teacher, $id));
        $this->setMethod('post');
        $this->setAction(Zend_Controller_Front::getInstance()->getBaseUrl().'/admin/ann/add');              
    }
}