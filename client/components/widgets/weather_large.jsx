var React = require('react');
var Link = require('react-router-component').Link
var ReactDom = require('react-dom')
var FontA_ = require('react-fontawesome')
var reqwest = require('reqwest')
var Main = require('../../main.jsx')


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
      <div className='widget weather'>
        <Link href='/'>Link</Link>
      </div>
    );
  }
})
