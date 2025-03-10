{* Page aide du site *}

{extends file="views/layout.tpl"}

{block name="contenu"}
	<section>
		<div class="container">
			<div class="row">
				<div class="col-12 p-5 text-center">
					<h1>Aide du site</h1>
				</div>
				<div class="col-12 p-5">
					{if isset($user.user_id) && $user.user_id != ''}
						<p>Sur cette page vous trouverez de l'aide sur toute les fonctionnalités du site en fonction
						de si vous êtes connecté ou pas.
						Chaque section correspond à une fonctionnalité et vous explique en détail comment faire 
						pour s'en servir</p>
					{else}
						<p>Sur cette page vous trouverez de l'aide sur toute les fonctionnalités du site en fonction
						de si vous êtes connecté ou pas.
						Chaque section correspond à une fonctionnalité et vous explique en détail comment faire 
						pour s'en servir</p>
						<p>Vous n'êtes actuellement pas connecté. Connectez vous ou créez votre compte
						si vous n'en possedez pas, pour accéder à toutes les fonctionnalités du site.
						Revenez ensuite sur cette page, pour voir leurs aides apparaitre.</p>
					{/if}
				</div>
			</div>
		</div>
	</section>
	<section>
		<div class="container">
			<div class="row">
				<div class="col-12 ps-5 pb-5">
					<h1 class="text-center p-5">Connexion au site</h1>
					<h2 class="pb-2">S'enregistrer / Créer son compte</h2>
					<p>Rendez vous sur cette <a href="{$base_url}user/create_account">page</a> ou cliquez sur le gros bouton vert
					disponible sur chaque page du site dans le coin en haut à droite.
					Remplissez ensuite tout les champs avec des données valides, puis appuyez sur le bouton s'enregistrer.</p>
				</div>
			</div>
		</div>
	</section>
	<section>
		<div class="container">
			<div class="row">
				<div class="col-12 ps-5 pb-5">
					<h2 class="pb-2">Se connecter</h2>
					<p>Rendez vous sur cette <a href="{$base_url}user/login">page</a> ou cliquez sur le gros bouton vert
					disponible sur chaque page du site dans le coin en haut à droite.
					Renseignez ensuite votre adresse 
					mail et votre mot de passe, puis appuyez sur le bouton se connecter.</p>
				</div>
			</div>
		</div>
	</section>
	<section>
		<div class="container">
			<div class="row">
				<div class="col-12 ps-5 pb-5">
					<h2 class="pb-2">Réinitialiser son mot de passe après un oubli</h2>
					<p>Rendez vous sur cette <a href="{$base_url}user/login">page</a> ou cliquez sur le gros bouton vert
					disponible sur chaque page du site dans le coin en haut à droite. Cliquez sur "Mot de passe oublié". 
					Renseignez ensuite votre adresse mail puis appuyez sur le bouton envoyer. Un mail sera 
					envoyé à l'adresse que vous avez renseigné si celle-ci appartient à un compte déjà existant.
					Rendez vous ensuite dans votre boîte mail, et cliquez sur le lien pour réinitialiser votre
					mot de passe. Attention : Le lien n'est valide que 15 minutes.</p>
				</div>
			</div>
		</div>
	</section>
	<section>
		<div class="container">
			<div class="row">
				<div class="col-12 ps-5 pb-5">
					<h2 class="pb-2">Se déconnecter</h2>
					<p>Cliquez sur l'icone <i class="fas fa-sign-out-alt"></i> tout en haut à droite de votre écran</p>
				</div>
			</div>
		</div>
	</section>
	<section>
		<div class="container">
			<div class="row">
				<div class="col-12 ps-5 pb-5">
					<h1 class="text-center p-5">Exploration</h1>
					<h2 class="pb-2">Rechercher un utrip</h2>
					<p>Rendez vous sur cette <a href="{$base_url}utrip/explore">page</a> ou cliquez sur le mot "Explorez" dans
					le menu de naviguation en haut de la page. Vous avez ensuite accès à
					une barre de recherche et quelques filtres que vous pouvez ou non remplir pour trouver
					votre utrip de rêve.</p>
				</div>
			</div>
		</div>
	</section>
	{if isset($user.user_id) && $user.user_id != ''}
	<section>
		<div class="container">
			<div class="row">
				<div class="col-12 ps-5 pb-5">
					<h2 class="pb-2">Créer son Utrip</h2>
					<p>Rendez vous sur cette <a href="{$base_url}utrip/raconte">page</a> ou cliquez sur le mot "Racontez" dans
					le menu de naviguation en haut de la page. Vous pouvez ensuite ajouter
					vos photos et remplir tout les champs. Une fois fini, appuyez sur le bouton Soumettre
					et le tour est joué !</p>
				</div>
			</div>
		</div>
	</section>
	<section>
		<div class="container">
			<div class="row">
				<div class="col-12 ps-5 pb-5">
					<h2 class="pb-2">Commenter et liker un utrip</h2>
					<p>Rendez vous sur n'importe quel utrip via cette <a href="{$base_url}utrip/explore">page</a> par
					exemple. En bas de page, vous verez le bouton J'aime pour laisser un like, ainsi
					qu'un champ pour laisser votre commentaire. Pensez à rester poli !</p>
				</div>
			</div>
		</div>
	</section>
	{/if}
	<section>
		<div class="container">
			<div class="row">
				<div class="col-12 ps-5 pb-5">
					<h1 class="text-center p-5">Forum</h1>
					<h2 class="pb-2">Accéder / Rechercher des Topic</h2>
					<p>Rendez vous sur cette <a href="{$base_url}forum/home">page</a> ou cliquez sur le mot "Forum" dans
					le menu de naviguation en haut de la page. Vous voyez donc la liste des topics,
					vous pouvez en chercher par mot clés grâce à la barre de recherche, et ensuite y accéder 
					en cliquant tout simplement sur le topic qui vous intéresse.</p>
				</div>
			</div>
		</div>
	</section>
	{if isset($user.user_id) && $user.user_id != ''}
	<section>
		<div class="container">
			<div class="row">
				<div class="col-12 ps-5 pb-5">
					<h2 class="pb-2">Créer son topic</h2>
					<p>Rendez vous sur cette <a href="{$base_url}forum/create_topic">page</a> ou cliquez sur le gros bouton vert
					"Je crée un topic" après vous être rendu sur la page Forum disponible sur
					le menu de naviguation en haut de la page. Remplissez ensuite
					les deux champs disponible, puis appuyez sur le bouton Créer.</p>
				</div>
			</div>
		</div>
	</section>
	{/if}
	<section>
		<div class="container">
			<div class="row">
				<div class="col-12 ps-5 pb-5">
					<h1 class="text-center p-5">Contact</h1>
					<h2 class="pb-2">Utiliser le formulaire de contact</h2>
					<p>Rendez vous sur cette <a href="{$base_url}page/contact">page</a> ou cliquez sur le lien "Nous contacter"
					disponible sur chaque bas de page. Remplissez ensuite tout les champs,
					puis appuyez sur le bouton envoyer.</p>
				</div>
			</div>
		</div>
	</section>
	{if isset($user.user_id) && $user.user_id != ''}
		<section>
			<div class="container">
				<div class="row">
					<div class="col-12 ps-5 pb-5">
						<h1 class="text-center p-5">Informations personnelles</h1>
						<h2 class="pb-2">Voir son profil</h2>

						<p>Rendez vous sur cette <a href="{$base_url}user/user?id={$user.user_id}">page</a> 

						ou cliquez sur l'icone <i class="fas fa-user"></i> à côté de "Bonjour {$user.user_firstname}".</p>
					</div>
				</div>
			</div>
		</section>
		<section>
			<div class="container">
				<div class="row">
					<div class="col-12 ps-5 pb-5">
						<h2 class="pb-2">Modifier son profil / ses informations</h2>
						<p>Rendez vous sur cette <a href="{$base_url}user/edit_profile">page</a> disponible
						au bas de votre profil. 
						Modifiez ensuite les champs que vous voulez.</p><p>
						Pour modifier votre photo de profil, rendez vous sur cette <a href="{$base_url}user/edit_pp">page</a> disponible

						au bas de votre profil également. 
						Importez ensuite votre photo. Veillez à ne pas mettre d'image inapropriée.</p>
					</div>
				</div>
			</div>
		</section>
		{if ($smarty.session.user.user_role == "modo") || ($smarty.session.user.user_role == "admin")}
			<section>
				<div class="container">
					<div class="row">
						<div class="col-12 ps-5 pb-5">
							<h1 class="text-center p-5">Modération</h1>
							<h2 class="pb-2">Accéder à la modération</h2>
							<p>Rendez vous sur cette <a href="{$base_url}page/manage">page</a> 

							ou cliquez sur l'icone <i class="fa fa-newspaper"></i> à côté de "Bonjour {$user.user_firstname}".</p>
							<p>Vous avez ensuite accès à 3 types de modération :</p>
						</div>
					</div>
				</div>
			</section>
			<section>
				<div class="container">
					<div class="row">
						<div class="col-12 ps-5 pb-5">
							<h2 class="pb-2">Gérer les articles</h2>
							<p>Rendez vous sur cette <a href="{$base_url}utrip/manage">page</a> 
							ou cliquez sur le bouton gérer les articles sur la page de <a href="{$base_url}page/manage">
							modération</a>. Vous pouvez également y accéder directement en cliquant sur n'importe
							quel article sur la page des <a href="{$base_url}forum/home">utrips</a> puis en allant en bas de la page.</p>

							<p>Vous pouvez accepter ou non un article pour 
							qu'il s'affiche et laisser un commentaire sur votre choix.
							Vous pouvez sinon modifier l'article.</p>
						</div>
					</div>
				</div>
			</section>
			<section>
				<div class="container">
					<div class="row">
						<div class="col-12 ps-5 pb-5">
							<h2 class="pb-2">Gérer les topics</h2>
							<p>Rendez vous sur cette <a href="{$base_url}forum/manage">page</a> 
							ou cliquez sur le bouton gérer les topics sur la page de <a href="{$base_url}page/manage">
							modération</a>. Vous pouvez également y accéder directement en cliquant sur n'importe
							quel topics sur la page des <a href="{$base_url}forum/home">forums</a> puis en allant en bas de la page.</p>
							<p>Vous pouvez accepter ou non un topic pour 
							qu'il s'affiche et laisser un commentaire sur votre choix.</p>
						</div>
					</div>
				</div>
			</section>
			<section>
				<div class="container">
					<div class="row">
						<div class="col-12 ps-5 pb-5">
							<h2 class="pb-2">Gérer les utilisateurs</h2>
							<p>Rendez vous sur cette <a href="{$base_url}user/manage">page</a> 
							ou cliquez sur le bouton gérer les utilisateurs sur la page de <a href="{$base_url}page/manage">
							modération</a>. Vous pouvez également y accéder directement en cliquant sur n'importe
							quel utilisateurs puis en allant en bas de la page.</p>
							<p>Vous pouvez bannir un utilisateur et laisser un commentaire sur votre choix.</p>
						</div>
					</div>
				</div>
			</section>
		{/if}
	{/if}
{/block}