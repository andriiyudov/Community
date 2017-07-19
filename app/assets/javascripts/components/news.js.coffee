@News = React.createClass
	getInitialState: ->
		articles: @props.data
		current_user: @props.current_user

	getDefaulProps: ->
		articles: []

	addArticle: (article) ->
		articles = @state.articles.slice()
		articles.unshift article
		@setState articles: articles

	deleteArticle: (article) ->
		idx = @state.articles.indexOf article
		@state.articles.splice idx, 1
		@setState articles: @state.articles

	showForm: ->
		$('.mod_hw').css("display", "block");

	hideForm: (event) ->
		if $(event.target).is($('.mod_hw'))
			$('.mod_hw').css("display", "none");

	render: ->
		React.DOM.div
			className: 'articles'
			React.DOM.button
				id: 'art_button'
				onClick: @showForm
				'Add news'
			React.DOM.div
				className: 'mod_hw'
				onClick: @hideForm
				React.DOM.div
					id: 'art_mod'
					React.createElement ArticleForm, handleNewArticle: @addArticle, current_user: @props.current_user
		
			for article in @state.articles
				React.createElement Article, key: article.id, article: article, current_user: @props.current_user, handleDeleteArticle: @deleteArticle
