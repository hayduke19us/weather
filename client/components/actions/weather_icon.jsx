var Config = require('../../config/config.js')

var React = require('react')

function iconSwitch (icon) {
  switch ( icon ) {
    case "partly-cloudy-day":
      return 'cloud sun'
      break
    case "partly-cloudy-night":
      return 'cloud moon'
      break
    default:
      return 'sun'
      break
  }
}

module.exports = React.createClass({

  switchIcon: function(icon){
    console.log(iconSwitch(icon))
    return iconSwitch(icon)
  },

  iconStr: function(){
    var str =  "climacon " + this.switchIcon(this.props.icon) + " large-icon"
    console.log(str)
    return str
  },

  render: function() {
    return (
      <div>
        <p><span className={this.iconStr()}/></p>
      </div>
    )
  }
})
