<div id="comments" class="tab">
<?php foreach($comments as $comment): ?>
<div class="comment_container"><a class="commentlink" name="comment<?php echo Filters::noXSS($comment['comment_id']); ?>" id="comment<?php echo Filters::noXSS($comment['comment_id']); ?>"></a>
<?php if($fs->prefs['enable_avatars'] == 1) : ?><?php echo tpl_userlinkavatar($comment['user_id'], $fs->prefs['max_avatar_size'], 'av_comment'); ?>
<?php else: ?><?php echo tpl_userlink($comment['user_id']); ?>
<?php endif; ?>
<div class="date"></span><?php echo Filters::noXSS(formatDate($comment['date_added'], true)); ?></div>
<div class="DoNotPrint">
<?php if ($user->perms('edit_comments') || ($user->perms('edit_own_comments') && $comment['user_id'] == $user->id)): ?>
<a class="button fa fa-pencil" href="<?php echo Filters::noXSS($_SERVER['SCRIPT_NAME']); ?>?do=editcomment&amp;task_id=<?php echo Filters::noXSS($task_details['task_id']); ?>&amp;id=<?php echo Filters::noXSS($comment['comment_id']); ?>"
 title="<?php echo Filters::noXSS(L('edit')); ?>">&nbsp;</a><?php endif; ?>
<?php if ($user->perms('delete_comments')): ?>
<?php echo tpl_form(CreateUrl('details', $task_details['task_id']),null,null,null,'class="delcomment"'); ?>
<input type="hidden" name="action" value="details.deletecomment">
<input type="hidden" name="comment_id" value="<?php echo $comment['comment_id']; ?>">
<?php $confirm = (isset($comment_attachments[$comment['comment_id']])) ? sprintf(L('confirmdeletecomment'), L('attachementswilldeleted')) : sprintf(L('confirmdeletecomment'), '')  ?>
<button class="fa fa-trash" type="submit" onclick="return confirm('<?php echo Filters::noJsXSS($confirm); ?>');"><?php echo Filters::noXSS(L('delete')); ?></button>
</form><?php endif; ?></div>
<div class="comment">
<?php if(isset($comment_changes[$comment['date_added']])): ?>
<ul class="comment_changes">
<?php foreach($comment_changes[$comment['date_added']] as $change): ?><li><?php echo event_description($change); ?></li><?php endforeach; ?>
</ul>
<?php endif; ?>
<div class="commenttext"><?php echo TextFormatter::render($comment['comment_text'], 'comm', $comment['comment_id'], $comment['content']); ?></div>
<?php
if (isset($comment_attachments[$comment['comment_id']])) {
  $this->display('common.attachments.tpl', 'attachments', $comment_attachments[$comment['comment_id']]);
}
if (isset($comment_links[$comment['comment_id']])) {
  $this->display('common.links.tpl', 'links', $comment_links[$comment['comment_id']]);
}
?></div>
<div class="clear"></div>
</div>
<?php endforeach; ?>

<?php if ($user->perms('add_comments') && (!$task_details['is_closed'] || $proj->prefs['comment_closed'])): ?>
<h4><?php echo Filters::noXSS(L('addcomment')); ?></h4>
  <?php echo tpl_form(CreateUrl('details', $task_details['task_id']), 'comment', 'post', 'multipart/form-data'); ?>
    <div>
      <?php if (defined('FLYSPRAY_HAS_PREVIEW')): ?>
      <div class="hide preview" id="preview"></div>
      <?php endif; ?>
      <input type="hidden" name="action" value="details.addcomment" />
      <input type="hidden" name="task_id" value="<?php echo Filters::noXSS(Req::val('task_id', $task_details['task_id'])); ?>" />
      <?php if ($user->perms('create_attachments')): ?>
      <div id="uploadfilebox">
        <span style="display: none;"><?php // this span is shown/copied in javascript when adding files ?>
          <input tabindex="5" class="file" type="file" size="55" name="userfile[]" />
            <a href="javascript://" tabindex="6" onclick="removeUploadField(this);"><?php echo Filters::noXSS(L('remove')); ?></a><br />
        </span>
        <noscript>
          <span>
            <input tabindex="5" class="file" type="file" size="55" name="userfile[]" />
              <a href="javascript://" tabindex="6" onclick="removeUploadField(this);"><?php echo Filters::noXSS(L('remove')); ?></a><br />
          </span>
        </noscript>
      </div>
      <button id="uploadfilebox_attachafile" tabindex="7" type="button" onclick="addUploadFields()">
        <?php echo Filters::noXSS(L('uploadafile')); ?> (<?php echo Filters::noXSS(L('max')); ?> <?php echo Filters::noXSS($fs->max_file_size); ?> <?php echo Filters::noXSS(L('MiB')); ?>)
      </button>
      <button id="uploadfilebox_attachanotherfile" tabindex="7" style="display: none" type="button" onclick="addUploadFields()">
         <?php echo Filters::noXSS(L('attachanotherfile')); ?> (<?php echo Filters::noXSS(L('max')); ?> <?php echo Filters::noXSS($fs->max_file_size); ?> <?php echo Filters::noXSS(L('MiB')); ?>)
      </button>

<div id="addlinkbox">
    <span style="display: none">
	 <input tabindex="8" class="text" type="text" size="28" maxlength="100" name="userlink[]" />
	 <a href="javascript://" tabindex="9" onclick="removeLinkField(this, 'addlinkbox');"><?php echo Filters::noXSS(L('remove')); ?></a><br />
    </span>
    <noscript>
	 <span>
	       <input tabindex="8" class="text" type="text" size="28" maxlength="100" name="userlink[]" />
	       <a href="javascript://" tabindex="9" onclick="removeLinkField(this, 'addlinkbox');"><?php echo Filters::noXSS(L('remove')); ?></a><br />
	 </span>
    </noscript>
</div>
<button id="addlinkbox_addalink" tabindex="10" type="button" onclick="addLinkField('addlinkbox')">
	<?php echo Filters::noXSS(L('addanotherlink')); ?>
</button>
<button id="addlinkbox_addanotherlink" tabindex="10" style="display: none" type="button" onclick="addLinkField('addlinkbox')">
	<?php echo Filters::noXSS(L('addanotherlink')); ?>
</button>
      <?php endif; ?>
      <?php echo TextFormatter::textarea('comment_text', 10, 72, array('accesskey' => 'r', 'tabindex' => 8, 'id' => 'comment_text')); ?>


      <button accesskey="s" tabindex="9" type="submit"><?php echo Filters::noXSS(L('addcomment')); ?></button>
      <?php if (defined('FLYSPRAY_HAS_PREVIEW')): ?>
      <button tabindex="9" type="button" onclick="showPreview('comment_text', '<?php echo Filters::noJsXSS($baseurl); ?>', 'preview')"><?php echo Filters::noXSS(L('preview')); ?></button>
      <?php endif; ?>
      <?php if (!$watched): ?>
      <?php echo tpl_checkbox('notifyme', Req::val('notifyme', !(Req::val('action') == 'details.addcomment')), 'notifyme'); ?> <label class="left" for="notifyme"><?php echo Filters::noXSS(L('notifyme')); ?></label>
      <?php endif; ?>
    </div>
  </form>
  <?php endif; ?>
</div>
