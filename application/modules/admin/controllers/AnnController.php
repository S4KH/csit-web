<?php

class Admin_AnnController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
        $contextSwitch = $this->_helper->getHelper('contextSwitch');
        $contextSwitch ->addActionContext('retr', 'json')
                       ->initContext();
    }

    public function indexAction()
    {
        // action body        
        $identity = Zend_Auth::getInstance()->getStorage()->read();
        $ann = new Model_DbTable_Ann();
        if($identity->role=='admin')
            $annv = $ann->fetchAll();
        else {
            $annv = $ann->fetchAll($ann->select()->where('uid = ?', $identity->uid));
        }
        $this->view->examc = $annv;
    }

    public function addAction()
    {
        // action body
                
        $ann = new Model_DbTable_Ann();
        $annf = new Admin_Form_AnnForm();
        $identity = Zend_Auth::getInstance()->getStorage()->read();
        $error = '';        
        if($this->getRequest()->isPost()){                
                if($annf->isValid($_POST)){
                    $etime = $annf->getValue('etime');
                    $edate = $annf->getValue('edate');
                    $room = $annf->getValue('rno');
                    $cond = array();
                    $check = $ann->fetchRow($ann->select()->where('edate = ? ' , 
                                                                  $edate));
                    if($check!=NULL)
                        $error = 'There is an Exam'; 
                    else {                                       
                        $data = array('etime' => $annf->getValue('etime'), 'lesson' => $annf->getValue('lessonname'), 'rno' => $annf->getValue('rno'),
                        'eclass' => $annf->getValue('classes'), 'teachers' => $annf->getValue('teachers'),'edate' => $annf->getValue('edate'),'uid' => $identity->uid);
                        $ann->insert($data);
                        $error = "Added successfully";
                    }
                    
                }
        }
        $teach = new Model_DbTable_Teacher();        
        $this->view->examc = $ann->fetchAll($ann->select()
                                                ->order('edate ASC'));
        $this->view->teachc = $teach->fetchAll();
        $this->view->error = $error;
    }

    public function editAction()
    {
        // action body
        if($this->_getParam('id')){
            $nid = $this->_getParam('id');
        }
        $annf = new Admin_Form_AnnForm();
        $this->view->annf = $newsf;
        $identity = Zend_Auth::getInstance()->getStorage()->read();
        if($this->getRequest()->isPost()){                
                if($annf->isValid($_POST)){
                    $where = array('id = ?' => $nid);                    
                    $data = array('time' => $annf->getValue('datePicker'), 'content' => $annf->getValue('content'), 'rNo' => $annf->getValue('rNo'));
                    $news->update($data, $where);
                    echo "Added successfully";
                }
        }
    }

    public function delAction()
    {
        // action body
        if($this->_getParam('id')){
            $id = $this->_getParam('id', -1);
            if($id!=-1){
                $news = new Model_DbTable_Ann();
                $where = array('id = ?' => $id);                    
                $news->delete($where);
                $this->_redirect('admin/ann/add');        
            }
        }        
    }

    public function retrAction()
    {
        // action body
            $name = $this->_getParam('ts');                   
            $teachTbl = new Model_DbTable_Teacher();
            $teach = $teachTbl->fetchAll($teachTbl->select()->where('tname Like ?', $name.'%'));
            $data=array();
            foreach ($teach as $row){
                $data [] =array(
                'id' => $row['tid'],
                'name' => $row['tname']);
            }
            $this->view->teachs = $data;         
    }
}









