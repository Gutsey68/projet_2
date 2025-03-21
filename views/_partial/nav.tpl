<nav class="navbar navbar-expand-lg">
    <div class="container-fluid ">
        <div class="col-md-3">
            <a class="{if ($strPage == "home")} active{/if}" href="{$base_url}">
                <div class="row">
                    <div class="col-2"><img width="50px" height="50px" src="assets/images/logo-projet-2.png" alt="">
                    </div>
                    <div class="col-8">
                        <p>Voyage<span class="fst-italic">Voyage</span></p>
                    </div>
                </div>
            </a>
        </div>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse col-md-9" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 nav-fill">
                <li class="nav-item">
                    <a class="nav-link flex-fill {if ($strPage == "explore")} active{/if}" href="{$base_url}utrip/explore"><i
                            class="fa-solid fa-compass"></i> Explorez</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link flex-fill {if ($strPage == "raconte")} active{/if}"
                        href="{$base_url}utrip/raconte">Racontez</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link flex-fill {if ($strPage == "forum")} active{/if}" href="{$base_url}forum/home">Forum</a>
                </li>
                <li class="nav-item">
                    <div id="nav-form">
                        <form class="my-lg-0" method="post" action="{$base_url}utrip/explore">
                            <div class="inputgroup col-12">
                                <input type="text" id="navinput" placeholder="Rechercher un voyage" name="keywords"
                                    aria-label="Rechercher un voyage">
                                <button id="navbutton">
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                </button>
                            </div>
                        </form>
                    </div>
                </li>
                    {if isset($user.user_id) && $user.user_id != ''}

                        <li class="nav-item ">
                            <a class="nav-link flex-fill " href="{$base_url}user/user?id={$user.user_id}" title="Modifier mon compte">
                                <i class="fas fa-user"></i> Bonjour {$smarty.session.user.user_firstname}
                            </a>
                        </li>
                        {if ($smarty.session.user.user_role == "modo") || ($smarty.session.user.user_role == "admin") }
                            <li class="nav-item ">
						        <a class="nav-link flex-fill" href="{$base_url}page/manage" alt="Gérer les articles" ><i class="fa fa-newspaper"></i></a>
                            </li>
                        {/if}
						<!-- Si connecté -->
                        <li class="nav-item ">
                            <a class="nav-link flex-fill" href="{$base_url}user/logout" title="Se déconnecter">
                                <i class="fas fa-sign-out-alt"></i>
                            </a> 
                        </li>
                    {else}
                        <div class="button-center ps-3">
                        <a class="green-btn" href="{$base_url}user/login"><i class="fa-solid fa-user"></i>S'enregistrer / Se connecter</a>
                        </div>
                    {/if}
                
            </ul>
        </div>
    </div>
</nav>