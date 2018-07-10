<?php
	require_once("action/CommonAction.php");

	class AjaxEnterAction extends CommonAction {
        public $result;

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_MEMBER);
		}

		protected function executeAction() {

			$data = [];
			$data["key"] = $_SESSION["key"];
			$data["id"] = $_POST["id"];

           		 $this->result = CommonAction::callAPI("enter", $data);

    

        	}
	}