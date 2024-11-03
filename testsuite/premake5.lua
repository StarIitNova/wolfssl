project "testsuite"
    language "C"
    targetdir "%{cfg.buildcfg}/%{cfg.architecture}"
    objdir "%{cfg.buildcfg}/%{cfg.architecture}/bin-int"

    files {
        "../examples/client/client.c",
        "../examples/echoclient/echoclient.c",
        "../examples/echoserver/echoserver.c",
        "../examples/server/server.c",
        "../wolfcrypt/test/test.c",
        "testsuite.c"
    }

    includedirs {
        "../"
    }

    defines {
        "NO_MAIN_DRIVER",
        "WOLFSSL_LIB",
        "WOLFSSL_USER_SETTINGS"
    }

    filter "platforms:Static32"
        kind "StaticLib"
        architecture "x32"

    filter "platforms:Shared32"
        kind "SharedLib"
        architecture "x32"

        defines {
            "WOLFSSL_DLL"
        }

    filter "platforms:Static64"
        kind "StaticLib"
        architecture "x64"

    filter "platforms:Shared64"
        kind "SharedLib"
        architecture "x64"

        defines {
            "WOLFSSL_DLL"
        }

    filter "system:Windows"
        includedirs {
            "../IDE/WIN",
        }

        files {
            "../IDE/WIN/user_settings.h"
        }

        links {
            "Ws2_32"
        }