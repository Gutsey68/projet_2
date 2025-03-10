{* La view d'un résumé d'un topic du forum *}

<div class="col-12 resume-topic">
    <div class="card mb-3">
        <div class="card-header">
            <a class="blue-link" href="{$base_url}user/user?id={$objForum->getCreatorId()}">{$objForum->getCreator()}</a>
        </div>
        <a class="text-decoration-none green-title shadow" href="{$base_url}forum/topic?id={$objForum->getId()}">
            <div class="card-body">
                <h3 class="card-title">{$objForum->getTitle()}</h3>
                <p class="card-text">
                    {if ($strPage == "index")}
                        {$objForum->getContentSummary(UtripCtrl::MAX_CONTENT)}
                    {else if ($strPage == "user")}
                        {$objForum->getContentSummary(UserCtrl::MAX_CONTENT)}
                    {else }
                        {$objForum->getContentSummary(ForumCtrl::MAX_CONTENT)}
                    {/if}
                </p>
            </div>
        </a>
    </div>
</div>