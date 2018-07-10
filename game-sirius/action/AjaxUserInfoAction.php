<?php
	require_once("action/CommonAction.php");

	class AjaxUserInfoAction extends CommonAction {
        public $result;

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_MEMBER);
		}

		protected function executeAction() {
            $data = array("key" => $_SESSION["key"]);
			$this->result = CommonAction::callAPI("user-info", $data);

        
        }
	}