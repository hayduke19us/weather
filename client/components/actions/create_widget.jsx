var React = require('react')
var FontA_ = require('react-fontawesome')

module.exports = React.createClass({
  getInitialState: function () {
    return {
      name: 'create_widget'
    }
  },

  handleClick: function () {
    alert('clicked') 
  },

  render: function () {
    return (
        <button href="#">
          Create a new Widget!
        </button>
    )
  }
})
