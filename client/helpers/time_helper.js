module.exports = {

  humanTime: function humanTime(time) {
    var date = new Date(time*1000)
        dateStr = date.toDateString()
        hour    = date.getHours()
        minutes = date.getMinutes()
        return dateStr + ' ' + hour + ':' + minutes
  }

}
