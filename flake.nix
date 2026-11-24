{
    inputs = { } ;
    outputs =
        { self } :
            {
                lib =
                    { input ? x : x , output ? x : x } :
                        let
                            implementation =
                                { lib , ... } @module :
                                    let
                                        inputed = input module ;
                                        in
                                            with inputed ;
                                                {
                                                    options.ssh-key = lib.mkOption { type = lib.types.str ; } ;
                                                } ;
                            in
                                {
                                    checks = { } ;
                                    implementation = output implementation ;
                                } ;
            } ;
}