using QML
using Qt5QuickControls_jll
using SHA

function main()
    if isfile("main.qml")
        loadqml("main.qml")
        exec()
    elseif isfile("src/main.qml")
        loadqml("src/main.qml")
        exec()
    end
end

function openFile(path)
    path = replace(path, "file://" => "")
    return open(path)
end

function calcSha1(path)
    hash = sha1(openFile(path))
    return uppercase(bytes2hex(hash))
end

function calcSha2_256(path)
    hash = sha2_256(openFile(path))
    return uppercase(bytes2hex(hash))
end

function calcSha2_384(path)
    hash = sha2_384(openFile(path))
    return uppercase(bytes2hex(hash))
end

function calcSha2_512(path)
    hash = sha2_512(openFile(path))
    return uppercase(bytes2hex(hash))
end

function calcSha3_256(path)
    hash = sha3_256(openFile(path))
    return uppercase(bytes2hex(hash))
end

function calcSha3_384(path)
    hash = sha3_384(openFile(path))
    return uppercase(bytes2hex(hash))
end

function calcSha3_512(path)
    hash = sha3_512(openFile(path))
    return uppercase(bytes2hex(hash))
end

@qmlfunction calcSha1 calcSha2_256 calcSha2_384 calcSha2_512 calcSha3_256 calcSha3_384 calcSha3_512

main()