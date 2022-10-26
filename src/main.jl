using QML
using Qt5QuickControls_jll
using SHA

function openFile(path)
    path = replace(path, "file://" => "")
    return open(path)
end

function get_sha1(path)
    file = openFile(path)
    return uppercase(bytes2hex(sha1(file)))
end

function get_sha2_256(path)
    file = openFile(path)
    return uppercase(bytes2hex(sha2_256(file)))
end

function get_sha2_384(path)
    file = openFile(path)
    return uppercase(bytes2hex(sha2_384(file)))
end

function get_sha2_512(path)
    file = openFile(path)
    return uppercase(bytes2hex(sha2_512(file)))
end

function get_sha3_256(path)
    file = openFile(path)
    return uppercase(bytes2hex(sha3_256(file)))
end

function get_sha3_384(path)
    file = openFile(path)
    return uppercase(bytes2hex(sha3_384(file)))
end

function get_sha3_512(path)
    file = openFile(path)
    return uppercase(bytes2hex(sha3_512(file)))
end

@qmlfunction get_sha1 get_sha2_256 get_sha2_384 get_sha2_512 get_sha3_256 get_sha3_384 get_sha3_512

loadqml("main.qml")
exec()