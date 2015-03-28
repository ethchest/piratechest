{_, $, Backbone, Marionette } = require( '../common.coffee' )


class module.exports.SettingsView extends Marionette.LayoutView
	className: 'settings-view'
	template: _.template """
		<div class="content">
			<img src="images/note.svg" alt="">
			<p><strong>Pirate Chest</strong> is still a  work in progress so many settings are hardcoded, with time they will be extracted to this view to give users more fine grained control.</p>
			<p>For <strong>Documentation</strong> or to <strong>Report Bugs</strong> you can go to our github repo at: <a href="http://github.com/d11e9/piratechest">http://github.com/d11e9/piratechest</a>.</p>
		</div>
	"""