<?php
	/***
	* Récupérer les topics dans la BDD 
	* @author Groupe1
	*/
	include_once("connect.php");

	class ForumModel extends Model {

		/**
		* Constructeur de la classe 
		*/
		public function __construct() {
			parent::__construct();
		}

        /**
        * Méthode de récupération de tous les topics
        * @return Tableau des topics
        */
		public function findAll(int $intLimit = 0, $arrSearch = array()) {
			
			$strQuery     = "	SELECT topic_id, topic_title, topic_content, topic_date, topic_code, 
									   user_pseudo AS 'topic_creator' , topic_valid , user_id AS 'topic_creatorId'
								FROM topic
								INNER JOIN users ON topic_user_id = user_id";
			$strWhere	= " WHERE ";

			$strQuery	.= $strWhere . "topic_valid = 1";

			$strKeywords = $arrSearch['keywords'] ?? "";
			if ($strKeywords != '') {
				$strQuery 	.=  " AND (topic_title LIKE :keywords
							OR topic_content LIKE :keywords) ";
			}

			// Tri par ordre décroissant
			$strQuery 	.= " 
			ORDER BY topic_date DESC";

			if ($intLimit > 0){
				$strQuery 	.= " LIMIT :limit";
			}

			$rqPrep	= $this->_db->prepare($strQuery);

			if ($strKeywords != '') {$rqPrep->bindValue(":keywords", "%" . $strKeywords . "%", PDO::PARAM_STR);}
			if ($intLimit > 0) {$rqPrep->bindValue(":limit", $intLimit, PDO::PARAM_INT);}
			$rqPrep->execute();
			return $rqPrep->fetchAll();
		}

        /**
        * Méthode d'insertion d'un topic en BDD
        * @param object $objForum Objet forum
        * @return bool Résultat de l'opération
        */
		public function insert(object $objForum) {

			$strQuery	= "	INSERT INTO topic (topic_title, topic_content, topic_date, topic_code , topic_user_id , topic_valid )
								VALUES (:title, :content, NOW(), FLOOR(1 + (RAND() * 10000000000000)), :id , 1 );
								";

			$rqPrep	= $this->_db->prepare($strQuery);
			$rqPrep->bindValue(":title", $objForum->getTitle(), PDO::PARAM_STR);
			$rqPrep->bindValue(":content", $objForum->getContent(), PDO::PARAM_STR);
			$rqPrep->bindValue(":id", $_SESSION['user']['user_id'], PDO::PARAM_INT);

			return $rqPrep->execute();
		}
		
        /**
        * Méthode permettant de récupérer un topic en fonction de son id
        * @param int $id Identifiant du topic à récupérer
        * @return array Le détail du topic
        */  	
		public function get(int $id) : array|false{

			$strQuery 	= "SELECT topic_id, topic_title, topic_content, topic_date, topic_code, 
			user_pseudo AS 'topic_creator' , topic_valid , user_id AS 'topic_creatorId'
			FROM topic
			INNER JOIN users ON topic_user_id = user_id
							WHERE topic_id = ".$id;

			return $this->_db->query($strQuery)->fetch();			
		}

		
        /**
        * Méthode d'administration de la gestion des topics
        * @return array Liste des topics pour administration
        */
		public function findList(){

			$strQuery 	= "SELECT topic_id , topic_title , topic_content , topic_date, topic_code, topic_user_id AS 'topic_creator' , topic_valid
							FROM topic
							INNER JOIN users ON topic_user_id = user_id";
							
			if (!in_array($_SESSION['user']['user_role'], array('admin', 'modo'))){
				$strQuery 	.= " WHERE utrip_user_id = ".$_SESSION['user']['user_id'];
			}
			$strQuery 	.= " ORDER BY topic_date DESC;";

			return $this->_db->query($strQuery)->fetchAll();			
		}
				
        /**
        * Methode permettant de mettre à jour l'article avec les informations de modération
        * @param object $objArticle Objet article
        * @return bool Résultat de l'opération
        */
		public function moderate($objForum){
			$strQuery	= "	UPDATE topic
							SET topic_valid = :valid, 
								topic_comment = :comment, 
								topic_modo = :modo
							WHERE topic_id = :id";

			$rqPrep	= $this->_db->prepare($strQuery);

			$rqPrep->bindValue(":valid", $objForum->getValid(), PDO::PARAM_INT);
			$rqPrep->bindValue(":comment", $objForum->getComment(), PDO::PARAM_STR);
			$rqPrep->bindValue(":modo", $_SESSION['user']['user_id'], PDO::PARAM_INT);
			$rqPrep->bindValue(":id", $objForum->getId(), PDO::PARAM_INT);
			
			return $rqPrep->execute();			
		}
		
        /**
        * Méthode permettant de supprimer l'article en BDD
        * @param int $id Identifiant de l'article à supprimer
        * @return bool Résultat de l'opération
        */
		public function delete (int $id){

			$strQuery 	= "DELETE FROM topic
							WHERE topic_id = ".$id;

			return $this->_db->exec($strQuery);
		}
			
		
        /**
        * Méthode permettant de récupérer les comentaires d'un topic
        * @param int $id Identifiant du topic
        * @return array Liste des commentaires
        */    	
		public function getCom(int $id) : array|false{

			$strQuery 	= " SELECT comt_id, comt_content , comt_date, user_pseudo AS 'comt_creator', comt_user_id AS 'comt_creatorId' , comt_topic_id AS 'comt_utripId' FROM commenttopic
							INNER JOIN users ON comt_user_id = user_id
							WHERE comt_topic_id = '".$id."' ORDER BY comt_date";

			return $this->_db->query($strQuery)->fetchAll();			
		}

		
        /**
        * Méthode d'insertion d'un commentaire en BDD
        * @param object $objCommentTopic Objet CommentTopic
        * @return bool Résultat de l'opération
        */
		public function insertComt(object $objCommentTopic) {

			$strQuery	= "	INSERT INTO commenttopic (comt_content, comt_date, comt_user_id , comt_topic_id )
								VALUES (:content, NOW(), :user , :topic);
								";

			$rqPrep	= $this->_db->prepare($strQuery);

			$rqPrep->bindValue(":content", $objCommentTopic->getContent(), PDO::PARAM_STR);
			$rqPrep->bindValue(":user", $_SESSION['user']['user_id'], PDO::PARAM_INT);
			$rqPrep->bindValue(":topic", $_GET['id'], PDO::PARAM_INT);

			return $rqPrep->execute();
		}

        /**
         * Supprime un commentaire basé sur son ID.
         * @param int $comId L'ID du commentaire à supprimer.
         * @return bool Renvoie true si la suppression a réussi, false sinon.
         */
		public function deleteCom(int $comId): bool {
				
			$strQuery = "DELETE FROM commenttopic
						 WHERE comt_id = :com";

			$rqPrep = $this->_db->prepare($strQuery);

			$rqPrep->bindValue(":com", $comId, PDO::PARAM_INT);
			
			return $rqPrep->execute();
	}

        /**
        * Méthode de récupération de tous les topics d'un user
        * @param int $id Identifiant de l'utilisateur
        * @param int $intLimit Limite de topics à récupérer
        * @return array Tableau des topics
        */
		public function findForumByUser($id, int $intLimit = 0) {

			$strQuery 	= "SELECT topic_id, topic_title, topic_content, topic_date, topic_code, 
							user_pseudo AS 'topic_creator' , topic_valid , user_id AS 'topic_creatorId'
							FROM topic
							INNER JOIN users ON topic_user_id = user_id
							WHERE user_id = :id
							ORDER BY topic_date DESC LIMIT :limit  ";

			$rqPrep = $this->_db->prepare($strQuery);

			$rqPrep->bindValue(":limit", $intLimit, PDO::PARAM_INT);
			$rqPrep->bindValue(":id", $id, PDO::PARAM_INT);

			$rqPrep->execute();

			return $rqPrep->fetchAll();;
		}
	}
