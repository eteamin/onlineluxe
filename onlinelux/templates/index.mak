<%inherit file="local:templates.master"/>

<%def name="title()">
  Welcome to TurboGears 2.3, standing on the shoulders of giants, since 2007
</%def>
  <div class="row">
    <div class="col-md-8">
      <div class="jumbotron">
        <h1>Welcome to TurboGears 2.3</h1>
        <p>If you see this page it means your installation was successful!</p>
        <p>TurboGears 2 is rapid web application development toolkit designed to make your life easier.</p>
        <p>
          <a class="btn btn-primary btn-lg" href="http://www.turbogears.org" target="_blank">
            ${h.icon('book')} Learn more
          </a>
        </p>
      </div>
    </div>
    <div class="col-md-4 hidden-xs hidden-sm">
      <a class="btn btn-info btn-sm active" href="http://turbogears.readthedocs.io/en/latest">${h.icon('book')} TG2 Documentation</a> <span class="label label-success">new</span><em> Get Started</em><br/>
        <br/>
      <a class="btn btn-info btn-sm active" href="http://turbogears.readthedocs.io/en/latest/cookbook/cookbook.html">${h.icon('book')} TG2 CookBook</a><em> Read the Cookbook</em> <br/>
        <br/>
      <a class="btn btn-info btn-sm active" href="http://groups.google.com/group/turbogears">${h.icon('comment')} Join the Mail List</a> <em>for help/discussion</em><br/>
        <br/>
      <a class="btn btn-info btn-sm active" href="http://runnable.com/TurboGears">${h.icon('play')} Play on Runnable</a> <em>for basic examples</em><br/>
        <br/>
      <a class="btn btn-info btn-sm active" href="http://stackoverflow.com/questions/tagged/turbogears2">${h.icon('search')} Search Stackoverflow</a> <em>for questions</em>
    </div>
  </div>

  <div class="row">
    <div class="col-md-4">
      <h3>Code your data model</h3>
      <p> Design your data <code>model</code>, Create the database, and Add some bootstrap data.</p>
    </div>

    <div class="col-md-4">
      <h3>Design your URL architecture</h3>
      <p> Decide your URLs, Program your <code>controller</code> methods, Design your
        <code>templates</code>, and place some static files (CSS and/or Javascript). </p>
    </div>

    <div class="col-md-4">
      <h3>Distribute your app</h3>
      <p> Test your source, Generate project documents, Build a distribution.</p>
    </div>
  </div>

  <em class="pull-right small"> Thank you for choosing TurboGears.</em>