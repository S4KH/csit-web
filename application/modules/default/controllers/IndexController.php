<?php

class IndexController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */        
    }

    public function indexAction()
    {
        $newsTBL = new Model_DbTable_News();
        $filter = new Zend_Filter_StripTags();
        $news = $newsTBL->fetchAll($newsTBL->select()
                                           ->where('type!=?', 4)                                           
                                           ->order('etime DESC')
                                           ->limit(8, 2));
        
        $newst = $newsTBL->fetchAll($newsTBL->select()
                                           ->where('img_url != 1 ')                                           
                                           ->order('etime DESC'));                                           
                                                 
        foreach($news as $row){
                    $text=$filter->filter($row['content']);
                    $text=str_replace('&nbsp;',"", $text);
                    if (strlen($text)>200) {
                        $utf8marker=chr(128); 
                        $i=0;$n=200;
                        while(isset($text{$i})){
                            if ($text{$i}>=$utf8marker){
                                $i+=2;
                            } else $i++;
                            if($i>=200) break;
                        }
                        $text=substr($text, 0,$i);
                    }                    
                    $data [] =array(
                        'id' => $row['id'],
                        'title' => $row['title'],
                        'content' => $text,
                        'img_url' => $row['img_url'],                        
                    );                    
        } 
        $this->view->news = $data;
        $this->view->newst = $newst;                                                                        
    }
}

