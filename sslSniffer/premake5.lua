project "sslSniffer"
    language "C"
    targetdir "%{cfg.buildcfg}/%{cfg.architecture}"
    objdir "%{cfg.buildcfg}/%{cfg.architecture}/bin-int"

    files {
        "../src/sniffer.c",

        "../wolfssl/sniffer.h",
        "../wolfssl/sniffer_error.rc"
    }

    includedirs {
        "../"
    }

    defines {
        "WOLFSSL_LIB",
        "SSL_SNIFFER_EXPORTS",
        "WOLFSSL_USER_SETTINGS"
    }

    filter "platforms:Static32"
        kind "SharedLib" -- sslSniffer is always a shared library
        architecture "x32"

    filter "platforms:Shared32"
        kind "SharedLib"
        architecture "x32"

    filter "platforms:Static64"
        kind "SharedLib" -- sslSniffer is always a shared library
        architecture "x64"

    filter "platforms:Shared64"
        kind "SharedLib"
        architecture "x64"

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