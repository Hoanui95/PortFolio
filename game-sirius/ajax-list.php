<?php
    require_once("action/AjaxListAction.php");

    $action = new AjaxListAction();
    $action->execute();

	echo json_encode($action->result);
?>
