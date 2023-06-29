
exports.validateEmail = async (email) => {
    var regx=/^([a-zA-Z0-9\._]+)@([a-zA-Z0-9])+.([a-z]+)(.[a-z]+)?$/
    if(!(regx.test(email))) return false;
    return true;
};

