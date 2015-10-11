var React = require('react');
var Link = require('react-router-component').Link
var ReactDom = require('react-dom')
var FontA_ = require('react-fontawesome')
var reqwest = require('reqwest')


module.exports = React.createClass({
  getInitialState: function() {
    return {data: []};
  },

  componentDidMount: function() {
    if (this.isMounted()) {
    }
  },

  render: function() {
    return (
      <div className='widget lg weather'>
        <Link href='/'><h1>Home</h1></Link>
      </div>
    );
  }
})
