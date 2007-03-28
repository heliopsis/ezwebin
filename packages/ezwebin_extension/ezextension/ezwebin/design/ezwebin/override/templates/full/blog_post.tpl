{* Blog post - Full view *}

<div class="class-blog extrainfo">
    <div class="columns-blog float-break">
        <div class="main-column-position">
            <div class="main-column float-break">
                <div class="border-box">
                <div class="border-tl"><div class="border-tr"><div class="border-tc"></div></div></div>
                <div class="border-ml"><div class="border-mr"><div class="border-mc float-break">

                        <div class="content-view-line">
                            <div class="class-blog-post float-break">

                                <div class="attribute-header">
                                    <h1>{$node.data_map.title.content|wash}</h1>
                                </div>

                                <div class="attribute-byline">
                                    <p class="date">{$node.data_map.publication_date.content.timestamp|l10n(shortdatetime)}</p>
                                    <p class="author">{$node.object.owner.name}</p>
                                    <p class="tags"> {"Tags:"|i18n("design/ezwebin/full/blog_post")} 
                                         {foreach $node.data_map.tags.content.keywords as $keyword}
                                             <a href={concat( $node.parent.url_alias, "/(id)/", $node.parent.node_id, "/(tag)/", $keyword|rawurlencode )|ezurl} title="{$keyword}">{$keyword}</a>
                                             {delimiter}
                                               ,
                                             {/delimiter}
                                         {/foreach}
                                    </p>
                                </div>

                                <div class="attribute-body">
                                    {attribute_view_gui attribute=$node.data_map.body}
                                </div>

                                {if $node.data_map.enable_comments.data_int}
                                <div class="attribute-comments">
                                    <a name="comments" id="comments"></a>
                                    <h1>{"Comments"|i18n("design/ezwebin/full/blog_post")}</h1>
                                    <div class="content-view-children">
                                        {foreach fetch_alias( comments, hash( parent_node_id, $node.node_id ) ) as $comment}
                                            {node_view_gui view='line' content_node=$comment}
                                        {/foreach}
                                    </div>

                                   {if fetch( 'content', 'access', hash( 'access', 'create', 'contentobject', $node, contentclass_id, 'comment' ) )}
                                   <form method="post" action={"content/action"|ezurl}>
                                       <input type="hidden" name="ClassIdentifier" value="comment" />
                                       <input type="hidden" name="NodeID" value="{$node.object.main_node.node_id}" />
                                       <input type="hidden" name="ContentLanguageCode" value="{ezini( 'RegionalSettings', 'Locale', 'site.ini')}" />
                                       <input class="button new_comment" type="submit" name="NewButton" value="{'New comment'|i18n( 'design/ezwebin/full/article' )}" />
                                   </form>
                                   {else}
                                       <p>{'%login_link_startLog in%login_link_end or %create_link_startcreate a user account%create_link_end to comment.'|i18n( 'design/ezwebin/full/blog_post', , hash( '%login_link_start', concat( '<a href="', '/user/login'|ezurl(no), '">' ), '%login_link_end', '</a>', '%create_link_start', concat( '<a href="', "/user/register"|ezurl(no), '">' ), '%create_link_end', '</a>' ) )}</p>
                                   {/if}
                                </div>
                                {/if}
                            </div>
                        </div>

                </div></div></div>
                <div class="border-bl"><div class="border-br"><div class="border-bc"></div></div></div>
                </div>
            </div>
        </div>

        <div class="extrainfo-column-position">
            <div class="extrainfo-column">
                <div class="border-box">
                <div class="border-tl"><div class="border-tr"><div class="border-tc"></div></div></div>
                <div class="border-ml"><div class="border-mr"><div class="border-mc float-break">
                        {include uri='design:parts/blog/extra_info.tpl' used_node=$node.parent}
                </div></div></div>
                <div class="border-bl"><div class="border-br"><div class="border-bc"></div></div></div>
                </div>
            </div>
        </div>
    </div>
</div>