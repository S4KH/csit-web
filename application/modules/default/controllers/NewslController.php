<?php

class NewslController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
        $contextSwitch = $this->_helper->getHelper('contextSwitch');
        $contextSwitch ->addActionContext('ajax', array('json'))
                       ->initContext();
    }

    public function indexAction()
    {
        // action body
        
    }

    public function listnAction()
    {
        // action body		
        if($this->_getParam('type')){
        	$type = $this->_getParam('type', -1);
            $userTBl = new Model_DbTable_Users();
            if ($type!=-1){
                $page=$this->_getParam('page',1);
                switch ($type) {
                    case '1':
                        $eveTbl = new Model_DbTable_Event();
                        $this->view->type=$type;    
                        $events = $eveTbl->fetchAll($eveTbl->select()                
                                                           ->order('etime DESC'));
                        $whereU = array('uid = ?' => $events['uid']);
                        $paginator = Zend_Paginator::factory($events);                                        
                        break;
                    case '3':
                        $newsTBL = new Model_DbTable_News();
                        $filter = new Zend_Filter_StripTags();                    
                        $this->view->type=$type;    
                        $news = $newsTBL->fetchAll($newsTBL->select()                
                                                           ->order('etime DESC')
                                                           ->where('type=?', 3));
                        $whereU = array('uid = ?' => $news['uid']);                                                           
                        foreach($news as $row){
                            $text=$filter->filter($row['content']);
                            $text=str_replace('&nbsp;',".", $text);
                            if (strlen($text)>200) {
                                $utf8marker=chr(128); 
                                $i=0;$n=300;
                                while(isset($text{$i})){
                                    if ($text{$i}>=$utf8marker){
                                        $i+=2;
                                    } else $i++;
                                    if($i>=300) break;
                                }
                                $text=substr($text, 0,$i);
                            }
                            
                            $data [] =array(
                                'id' => $row['id'],
                                'title' => $row['title'],
                                'content' => $text,
                                'img_url' => $row['img_url'],
                                'etime' => $row['etime']
                            );
                        }                        
                        $paginator = Zend_Paginator::factory($data);                        
                        break;                        
                        default:
                            $this->_redirect('index/index');
                        break;         
                }
                $paginator->setItemCountPerPage(6);
                $paginator->setCurrentPageNumber($page);
                
                $this->view->paginator=$paginator;                
                $userInfo = $userTBl->fetchRow($whereU);
                $this->view->userInfo = $userInfo;                		
        	}
    	} else $this->_redirect('index/index');
    }

    public function shownAction()
    {
        // action body
        if($this->_getParam('type') && $this->_getParam('nid')){
            $nid = $this->_getParam('nid',-1);
    		$type = $this->_getParam('type',-1);
            if($nid != -1 && $type!=-1){
                $this->view->type = $type;
                switch ($type) {
                    case '2':                
                        $newsTBL = new Model_DbTable_Ann();                                
                        break;
                    case '3':                
                        $newsTBL = new Model_DbTable_News();
                        $where = array('id = ?' => $nid);
                        break;
                    default:
                        $this->_redirect('index/index');
                        break;
                } 
                if($type!=2){
        		  $news = $newsTBL->fetchRow($where);
        		  $this->view->value = $news;
                  
            	  $userTBl = new Model_DbTable_Users();
            	  $whereU = array('uid = ?' => 1);
            	  $userInfo = $userTBl->fetchRow($whereU);
            	  $this->view->userInfo = $userInfo;
                }else
                  $this->view->value = $newsTBL->fetchAll($newsTBL->select()
                                                                  ->order('edate ASC'));
                  $identity = Zend_Auth::getInstance()->getStorage()->read();
                  $this->view->identity=$identity;                                                                                      
        	} else $this->_redirect('index/index');
        } else $this->_redirect('index/index');
    }

    public function ajaxAction()
    {
        // action body
        $news=new Model_DbTable_Event();
        $list=$news->fetchAll($news->select()->order('etime ASC'));
        $data=array();        
        foreach ($list as $row){
            $data [] =array(            
                'id' => $row['id'],
                'title' => $row['title'],
                'date' => $row['etime']
            );
        }
        $this->view->list=$data;
    }


}







