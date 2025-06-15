module Gen.Cmd.Extra exposing
    ( moduleName_, perform, attempt, maybe, fromResult, fromMaybe
    , pure, andThen, with, add, withTrigger, addTrigger, addIf
    , addTriggerMaybe, addMaybe, call_, values_
    )

{-|
# Generated bindings for Cmd.Extra

@docs moduleName_, perform, attempt, maybe, fromResult, fromMaybe
@docs pure, andThen, with, add, withTrigger, addTrigger
@docs addIf, addTriggerMaybe, addMaybe, call_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Cmd", "Extra" ]


{-| Cmd costructor.
Useful when you want to artificially emit Cmd from update function.

    performed : Cmd String
    performed =
        perform "foo"

"real world" example:

    type alias Model =
        ()

    type Msg
        = Fire
        | FireRockets

    update : Msg -> Model -> ( Model, Cmd Msg )
    update msg () =
        case msg of
            Fire ->
                ( (), perform FireRockets )

            FireRockets ->
                Debug.crash "World ended:("

perform: msg -> Platform.Cmd.Cmd msg
-}
perform : Elm.Expression -> Elm.Expression
perform performArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "Cmd", "Extra" ]
             , name = "perform"
             , annotation =
                 Just
                     (Type.function
                          [ Type.var "msg" ]
                          (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                     )
             }
        )
        [ performArg_ ]


{-| Similar to perform but takes `Result msg` and performs action only on `Ok`.

    attempted : Cmd String
    attempted =
      attempt <| Ok "I'm fine"

    attempt (Err "Failed") == Cmd.none
    --> True

attempt: Result.Result x msg -> Platform.Cmd.Cmd msg
-}
attempt : Elm.Expression -> Elm.Expression
attempt attemptArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "Cmd", "Extra" ]
             , name = "attempt"
             , annotation =
                 Just
                     (Type.function
                          [ Type.namedWith
                              [ "Result" ]
                              "Result"
                              [ Type.var "x", Type.var "msg" ]
                          ]
                          (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                     )
             }
        )
        [ attemptArg_ ]


{-| Similar to attempt but works with `Maybe` instead

    maybeCmd : Cmd Int
    maybeCmd =
        maybe <| Just 1

    maybe Nothing == Cmd.none
    --> True

maybe: Maybe msg -> Platform.Cmd.Cmd msg
-}
maybe : Elm.Expression -> Elm.Expression
maybe maybeArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "Cmd", "Extra" ]
             , name = "maybe"
             , annotation =
                 Just
                     (Type.function
                          [ Type.maybe (Type.var "msg") ]
                          (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                     )
             }
        )
        [ maybeArg_ ]


{-| Construct from Result.

    resultCmd : Cmd (Result Never Int)
    resultCmd =
      fromResult identity (Ok 1)

    fromResult identity (Err ())
    --> Cmd.none

fromResult: (a -> msg) -> Result.Result x a -> Platform.Cmd.Cmd msg
-}
fromResult :
    (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
fromResult fromResultArg_ fromResultArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Cmd", "Extra" ]
             , name = "fromResult"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function [ Type.var "a" ] (Type.var "msg")
                          , Type.namedWith
                              [ "Result" ]
                              "Result"
                              [ Type.var "x", Type.var "a" ]
                          ]
                          (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                     )
             }
        )
        [ Elm.functionReduced "fromResultUnpack" fromResultArg_
        , fromResultArg_0
        ]


{-| Construct from Maybe.

    maybeCmd : Cmd (Maybe Int)
    maybeCmd =
      identity (Just 1)

    fromMaybe identity Nothing
    --> Cmd.none

fromMaybe: (a -> msg) -> Maybe a -> Platform.Cmd.Cmd msg
-}
fromMaybe :
    (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
fromMaybe fromMaybeArg_ fromMaybeArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Cmd", "Extra" ]
             , name = "fromMaybe"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function [ Type.var "a" ] (Type.var "msg")
                          , Type.maybe (Type.var "a")
                          ]
                          (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                     )
             }
        )
        [ Elm.functionReduced "fromMaybeUnpack" fromMaybeArg_, fromMaybeArg_0 ]


{-| Creates pair `model` with `Cmd.none`

    pair : ( String, Cmd msg )
    pair = pure "foo"

    pair
      |> Tuple.second
      |> ((==) Cmd.none)
    --> True

pure: model -> ( model, Platform.Cmd.Cmd msg )
-}
pure : Elm.Expression -> Elm.Expression
pure pureArg_ =
    Elm.apply
        (Elm.value
             { importFrom = [ "Cmd", "Extra" ]
             , name = "pure"
             , annotation =
                 Just
                     (Type.function
                          [ Type.var "model" ]
                          (Type.tuple
                               (Type.var "model")
                               (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                          )
                     )
             }
        )
        [ pureArg_ ]


{-| Allows chaining `update`-like functions.

    sendNotification : Model -> (Model, Cmd Msg)
    fireZeMissiles : Model -> (Model, Cmd Msg)

    model
        |> sendNotification -- we have (Model, Cmd Msg) now, but fireZeMissiles needs a Model
        |> andThen fireZeMissiles

andThen: 
    (model1 -> ( model2, Platform.Cmd.Cmd msg ))
    -> ( model1, Platform.Cmd.Cmd msg )
    -> ( model2, Platform.Cmd.Cmd msg )
-}
andThen : (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
andThen andThenArg_ andThenArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Cmd", "Extra" ]
             , name = "andThen"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "model1" ]
                              (Type.tuple
                                 (Type.var "model2")
                                 (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                              )
                          , Type.tuple
                              (Type.var "model1")
                              (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                          ]
                          (Type.tuple
                               (Type.var "model2")
                               (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                          )
                     )
             }
        )
        [ Elm.functionReduced "andThenUnpack" andThenArg_, andThenArg_0 ]


{-| Add Cmd to model to create a pair.

with: Platform.Cmd.Cmd msg -> model -> ( model, Platform.Cmd.Cmd msg )
-}
with : Elm.Expression -> Elm.Expression -> Elm.Expression
with withArg_ withArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Cmd", "Extra" ]
             , name = "with"
             , annotation =
                 Just
                     (Type.function
                          [ Type.namedWith [] "Cmd" [ Type.var "msg" ]
                          , Type.var "model"
                          ]
                          (Type.tuple
                               (Type.var "model")
                               (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                          )
                     )
             }
        )
        [ withArg_, withArg_0 ]


{-| Add new cmd to an existing pair.

add: 
    Platform.Cmd.Cmd msg
    -> ( model, Platform.Cmd.Cmd msg )
    -> ( model, Platform.Cmd.Cmd msg )
-}
add : Elm.Expression -> Elm.Expression -> Elm.Expression
add addArg_ addArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Cmd", "Extra" ]
             , name = "add"
             , annotation =
                 Just
                     (Type.function
                          [ Type.namedWith [] "Cmd" [ Type.var "msg" ]
                          , Type.tuple
                              (Type.var "model")
                              (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                          ]
                          (Type.tuple
                               (Type.var "model")
                               (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                          )
                     )
             }
        )
        [ addArg_, addArg_0 ]


{-| Trigger Cmd from Msg and create a pair

withTrigger: msg -> model -> ( model, Platform.Cmd.Cmd msg )
-}
withTrigger : Elm.Expression -> Elm.Expression -> Elm.Expression
withTrigger withTriggerArg_ withTriggerArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Cmd", "Extra" ]
             , name = "withTrigger"
             , annotation =
                 Just
                     (Type.function
                          [ Type.var "msg", Type.var "model" ]
                          (Type.tuple
                               (Type.var "model")
                               (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                          )
                     )
             }
        )
        [ withTriggerArg_, withTriggerArg_0 ]


{-| Add new trigger of Msg to an existing pair.

addTrigger: msg -> ( model, Platform.Cmd.Cmd msg ) -> ( model, Platform.Cmd.Cmd msg )
-}
addTrigger : Elm.Expression -> Elm.Expression -> Elm.Expression
addTrigger addTriggerArg_ addTriggerArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Cmd", "Extra" ]
             , name = "addTrigger"
             , annotation =
                 Just
                     (Type.function
                          [ Type.var "msg"
                          , Type.tuple
                              (Type.var "model")
                              (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                          ]
                          (Type.tuple
                               (Type.var "model")
                               (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                          )
                     )
             }
        )
        [ addTriggerArg_, addTriggerArg_0 ]


{-| Add new cmd to an existing pair under a certain condition.

    prevCmd : Cmd String
    prevCmd =
        perform "foo"

    newCmd : Cmd String
    newCmd =
        perform "bar"

    ( "model", prevCmd )
      |> addIf False newCmd
      |> Tuple.second
      |> ((==) prevCmd)
    --> True

addIf: 
    Bool
    -> Platform.Cmd.Cmd msg
    -> ( model, Platform.Cmd.Cmd msg )
    -> ( model, Platform.Cmd.Cmd msg )
-}
addIf : Bool -> Elm.Expression -> Elm.Expression -> Elm.Expression
addIf addIfArg_ addIfArg_0 addIfArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Cmd", "Extra" ]
             , name = "addIf"
             , annotation =
                 Just
                     (Type.function
                          [ Type.bool
                          , Type.namedWith [] "Cmd" [ Type.var "msg" ]
                          , Type.tuple
                              (Type.var "model")
                              (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                          ]
                          (Type.tuple
                               (Type.var "model")
                               (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                          )
                     )
             }
        )
        [ Elm.bool addIfArg_, addIfArg_0, addIfArg_1 ]


{-| `addTrigger` if Just, do nothing if Nothing

addTriggerMaybe: Maybe msg -> ( model, Platform.Cmd.Cmd msg ) -> ( model, Platform.Cmd.Cmd msg )
-}
addTriggerMaybe : Elm.Expression -> Elm.Expression -> Elm.Expression
addTriggerMaybe addTriggerMaybeArg_ addTriggerMaybeArg_0 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Cmd", "Extra" ]
             , name = "addTriggerMaybe"
             , annotation =
                 Just
                     (Type.function
                          [ Type.maybe (Type.var "msg")
                          , Type.tuple
                              (Type.var "model")
                              (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                          ]
                          (Type.tuple
                               (Type.var "model")
                               (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                          )
                     )
             }
        )
        [ addTriggerMaybeArg_, addTriggerMaybeArg_0 ]


{-| Add new cmd to an existing pair based on the Maybe value

    prevCmd : Cmd String
    prevCmd =
        perform "prev"

    ( "model", prevCmd )
      |> addMaybe identity Nothing
      |> Tuple.second
      |> ((==) prevCmd)
    --> True

addMaybe: 
    (a -> Platform.Cmd.Cmd msg)
    -> Maybe a
    -> ( model, Platform.Cmd.Cmd msg )
    -> ( model, Platform.Cmd.Cmd msg )
-}
addMaybe :
    (Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
addMaybe addMaybeArg_ addMaybeArg_0 addMaybeArg_1 =
    Elm.apply
        (Elm.value
             { importFrom = [ "Cmd", "Extra" ]
             , name = "addMaybe"
             , annotation =
                 Just
                     (Type.function
                          [ Type.function
                              [ Type.var "a" ]
                              (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                          , Type.maybe (Type.var "a")
                          , Type.tuple
                              (Type.var "model")
                              (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                          ]
                          (Type.tuple
                               (Type.var "model")
                               (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                          )
                     )
             }
        )
        [ Elm.functionReduced "addMaybeUnpack" addMaybeArg_
        , addMaybeArg_0
        , addMaybeArg_1
        ]


call_ :
    { perform : Elm.Expression -> Elm.Expression
    , attempt : Elm.Expression -> Elm.Expression
    , maybe : Elm.Expression -> Elm.Expression
    , fromResult : Elm.Expression -> Elm.Expression -> Elm.Expression
    , fromMaybe : Elm.Expression -> Elm.Expression -> Elm.Expression
    , pure : Elm.Expression -> Elm.Expression
    , andThen : Elm.Expression -> Elm.Expression -> Elm.Expression
    , with : Elm.Expression -> Elm.Expression -> Elm.Expression
    , add : Elm.Expression -> Elm.Expression -> Elm.Expression
    , withTrigger : Elm.Expression -> Elm.Expression -> Elm.Expression
    , addTrigger : Elm.Expression -> Elm.Expression -> Elm.Expression
    , addIf :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , addTriggerMaybe : Elm.Expression -> Elm.Expression -> Elm.Expression
    , addMaybe :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    }
call_ =
    { perform =
        \performArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Cmd", "Extra" ]
                     , name = "perform"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.var "msg" ]
                                  (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                             )
                     }
                )
                [ performArg_ ]
    , attempt =
        \attemptArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Cmd", "Extra" ]
                     , name = "attempt"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.namedWith
                                      [ "Result" ]
                                      "Result"
                                      [ Type.var "x", Type.var "msg" ]
                                  ]
                                  (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                             )
                     }
                )
                [ attemptArg_ ]
    , maybe =
        \maybeArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Cmd", "Extra" ]
                     , name = "maybe"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.maybe (Type.var "msg") ]
                                  (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                             )
                     }
                )
                [ maybeArg_ ]
    , fromResult =
        \fromResultArg_ fromResultArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Cmd", "Extra" ]
                     , name = "fromResult"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a" ]
                                      (Type.var "msg")
                                  , Type.namedWith
                                      [ "Result" ]
                                      "Result"
                                      [ Type.var "x", Type.var "a" ]
                                  ]
                                  (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                             )
                     }
                )
                [ fromResultArg_, fromResultArg_0 ]
    , fromMaybe =
        \fromMaybeArg_ fromMaybeArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Cmd", "Extra" ]
                     , name = "fromMaybe"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a" ]
                                      (Type.var "msg")
                                  , Type.maybe (Type.var "a")
                                  ]
                                  (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                             )
                     }
                )
                [ fromMaybeArg_, fromMaybeArg_0 ]
    , pure =
        \pureArg_ ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Cmd", "Extra" ]
                     , name = "pure"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.var "model" ]
                                  (Type.tuple
                                       (Type.var "model")
                                       (Type.namedWith
                                            []
                                            "Cmd"
                                            [ Type.var "msg" ]
                                       )
                                  )
                             )
                     }
                )
                [ pureArg_ ]
    , andThen =
        \andThenArg_ andThenArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Cmd", "Extra" ]
                     , name = "andThen"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "model1" ]
                                      (Type.tuple
                                         (Type.var "model2")
                                         (Type.namedWith
                                            []
                                            "Cmd"
                                            [ Type.var "msg" ]
                                         )
                                      )
                                  , Type.tuple
                                      (Type.var "model1")
                                      (Type.namedWith
                                         []
                                         "Cmd"
                                         [ Type.var "msg" ]
                                      )
                                  ]
                                  (Type.tuple
                                       (Type.var "model2")
                                       (Type.namedWith
                                            []
                                            "Cmd"
                                            [ Type.var "msg" ]
                                       )
                                  )
                             )
                     }
                )
                [ andThenArg_, andThenArg_0 ]
    , with =
        \withArg_ withArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Cmd", "Extra" ]
                     , name = "with"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.namedWith [] "Cmd" [ Type.var "msg" ]
                                  , Type.var "model"
                                  ]
                                  (Type.tuple
                                       (Type.var "model")
                                       (Type.namedWith
                                            []
                                            "Cmd"
                                            [ Type.var "msg" ]
                                       )
                                  )
                             )
                     }
                )
                [ withArg_, withArg_0 ]
    , add =
        \addArg_ addArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Cmd", "Extra" ]
                     , name = "add"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.namedWith [] "Cmd" [ Type.var "msg" ]
                                  , Type.tuple
                                      (Type.var "model")
                                      (Type.namedWith
                                         []
                                         "Cmd"
                                         [ Type.var "msg" ]
                                      )
                                  ]
                                  (Type.tuple
                                       (Type.var "model")
                                       (Type.namedWith
                                            []
                                            "Cmd"
                                            [ Type.var "msg" ]
                                       )
                                  )
                             )
                     }
                )
                [ addArg_, addArg_0 ]
    , withTrigger =
        \withTriggerArg_ withTriggerArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Cmd", "Extra" ]
                     , name = "withTrigger"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.var "msg", Type.var "model" ]
                                  (Type.tuple
                                       (Type.var "model")
                                       (Type.namedWith
                                            []
                                            "Cmd"
                                            [ Type.var "msg" ]
                                       )
                                  )
                             )
                     }
                )
                [ withTriggerArg_, withTriggerArg_0 ]
    , addTrigger =
        \addTriggerArg_ addTriggerArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Cmd", "Extra" ]
                     , name = "addTrigger"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.var "msg"
                                  , Type.tuple
                                      (Type.var "model")
                                      (Type.namedWith
                                         []
                                         "Cmd"
                                         [ Type.var "msg" ]
                                      )
                                  ]
                                  (Type.tuple
                                       (Type.var "model")
                                       (Type.namedWith
                                            []
                                            "Cmd"
                                            [ Type.var "msg" ]
                                       )
                                  )
                             )
                     }
                )
                [ addTriggerArg_, addTriggerArg_0 ]
    , addIf =
        \addIfArg_ addIfArg_0 addIfArg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Cmd", "Extra" ]
                     , name = "addIf"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.bool
                                  , Type.namedWith [] "Cmd" [ Type.var "msg" ]
                                  , Type.tuple
                                      (Type.var "model")
                                      (Type.namedWith
                                         []
                                         "Cmd"
                                         [ Type.var "msg" ]
                                      )
                                  ]
                                  (Type.tuple
                                       (Type.var "model")
                                       (Type.namedWith
                                            []
                                            "Cmd"
                                            [ Type.var "msg" ]
                                       )
                                  )
                             )
                     }
                )
                [ addIfArg_, addIfArg_0, addIfArg_1 ]
    , addTriggerMaybe =
        \addTriggerMaybeArg_ addTriggerMaybeArg_0 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Cmd", "Extra" ]
                     , name = "addTriggerMaybe"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.maybe (Type.var "msg")
                                  , Type.tuple
                                      (Type.var "model")
                                      (Type.namedWith
                                         []
                                         "Cmd"
                                         [ Type.var "msg" ]
                                      )
                                  ]
                                  (Type.tuple
                                       (Type.var "model")
                                       (Type.namedWith
                                            []
                                            "Cmd"
                                            [ Type.var "msg" ]
                                       )
                                  )
                             )
                     }
                )
                [ addTriggerMaybeArg_, addTriggerMaybeArg_0 ]
    , addMaybe =
        \addMaybeArg_ addMaybeArg_0 addMaybeArg_1 ->
            Elm.apply
                (Elm.value
                     { importFrom = [ "Cmd", "Extra" ]
                     , name = "addMaybe"
                     , annotation =
                         Just
                             (Type.function
                                  [ Type.function
                                      [ Type.var "a" ]
                                      (Type.namedWith
                                         []
                                         "Cmd"
                                         [ Type.var "msg" ]
                                      )
                                  , Type.maybe (Type.var "a")
                                  , Type.tuple
                                      (Type.var "model")
                                      (Type.namedWith
                                         []
                                         "Cmd"
                                         [ Type.var "msg" ]
                                      )
                                  ]
                                  (Type.tuple
                                       (Type.var "model")
                                       (Type.namedWith
                                            []
                                            "Cmd"
                                            [ Type.var "msg" ]
                                       )
                                  )
                             )
                     }
                )
                [ addMaybeArg_, addMaybeArg_0, addMaybeArg_1 ]
    }


values_ :
    { perform : Elm.Expression
    , attempt : Elm.Expression
    , maybe : Elm.Expression
    , fromResult : Elm.Expression
    , fromMaybe : Elm.Expression
    , pure : Elm.Expression
    , andThen : Elm.Expression
    , with : Elm.Expression
    , add : Elm.Expression
    , withTrigger : Elm.Expression
    , addTrigger : Elm.Expression
    , addIf : Elm.Expression
    , addTriggerMaybe : Elm.Expression
    , addMaybe : Elm.Expression
    }
values_ =
    { perform =
        Elm.value
            { importFrom = [ "Cmd", "Extra" ]
            , name = "perform"
            , annotation =
                Just
                    (Type.function
                         [ Type.var "msg" ]
                         (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                    )
            }
    , attempt =
        Elm.value
            { importFrom = [ "Cmd", "Extra" ]
            , name = "attempt"
            , annotation =
                Just
                    (Type.function
                         [ Type.namedWith
                             [ "Result" ]
                             "Result"
                             [ Type.var "x", Type.var "msg" ]
                         ]
                         (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                    )
            }
    , maybe =
        Elm.value
            { importFrom = [ "Cmd", "Extra" ]
            , name = "maybe"
            , annotation =
                Just
                    (Type.function
                         [ Type.maybe (Type.var "msg") ]
                         (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                    )
            }
    , fromResult =
        Elm.value
            { importFrom = [ "Cmd", "Extra" ]
            , name = "fromResult"
            , annotation =
                Just
                    (Type.function
                         [ Type.function [ Type.var "a" ] (Type.var "msg")
                         , Type.namedWith
                             [ "Result" ]
                             "Result"
                             [ Type.var "x", Type.var "a" ]
                         ]
                         (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                    )
            }
    , fromMaybe =
        Elm.value
            { importFrom = [ "Cmd", "Extra" ]
            , name = "fromMaybe"
            , annotation =
                Just
                    (Type.function
                         [ Type.function [ Type.var "a" ] (Type.var "msg")
                         , Type.maybe (Type.var "a")
                         ]
                         (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                    )
            }
    , pure =
        Elm.value
            { importFrom = [ "Cmd", "Extra" ]
            , name = "pure"
            , annotation =
                Just
                    (Type.function
                         [ Type.var "model" ]
                         (Type.tuple
                              (Type.var "model")
                              (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                         )
                    )
            }
    , andThen =
        Elm.value
            { importFrom = [ "Cmd", "Extra" ]
            , name = "andThen"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "model1" ]
                             (Type.tuple
                                (Type.var "model2")
                                (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                             )
                         , Type.tuple
                             (Type.var "model1")
                             (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                         ]
                         (Type.tuple
                              (Type.var "model2")
                              (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                         )
                    )
            }
    , with =
        Elm.value
            { importFrom = [ "Cmd", "Extra" ]
            , name = "with"
            , annotation =
                Just
                    (Type.function
                         [ Type.namedWith [] "Cmd" [ Type.var "msg" ]
                         , Type.var "model"
                         ]
                         (Type.tuple
                              (Type.var "model")
                              (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                         )
                    )
            }
    , add =
        Elm.value
            { importFrom = [ "Cmd", "Extra" ]
            , name = "add"
            , annotation =
                Just
                    (Type.function
                         [ Type.namedWith [] "Cmd" [ Type.var "msg" ]
                         , Type.tuple
                             (Type.var "model")
                             (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                         ]
                         (Type.tuple
                              (Type.var "model")
                              (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                         )
                    )
            }
    , withTrigger =
        Elm.value
            { importFrom = [ "Cmd", "Extra" ]
            , name = "withTrigger"
            , annotation =
                Just
                    (Type.function
                         [ Type.var "msg", Type.var "model" ]
                         (Type.tuple
                              (Type.var "model")
                              (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                         )
                    )
            }
    , addTrigger =
        Elm.value
            { importFrom = [ "Cmd", "Extra" ]
            , name = "addTrigger"
            , annotation =
                Just
                    (Type.function
                         [ Type.var "msg"
                         , Type.tuple
                             (Type.var "model")
                             (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                         ]
                         (Type.tuple
                              (Type.var "model")
                              (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                         )
                    )
            }
    , addIf =
        Elm.value
            { importFrom = [ "Cmd", "Extra" ]
            , name = "addIf"
            , annotation =
                Just
                    (Type.function
                         [ Type.bool
                         , Type.namedWith [] "Cmd" [ Type.var "msg" ]
                         , Type.tuple
                             (Type.var "model")
                             (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                         ]
                         (Type.tuple
                              (Type.var "model")
                              (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                         )
                    )
            }
    , addTriggerMaybe =
        Elm.value
            { importFrom = [ "Cmd", "Extra" ]
            , name = "addTriggerMaybe"
            , annotation =
                Just
                    (Type.function
                         [ Type.maybe (Type.var "msg")
                         , Type.tuple
                             (Type.var "model")
                             (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                         ]
                         (Type.tuple
                              (Type.var "model")
                              (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                         )
                    )
            }
    , addMaybe =
        Elm.value
            { importFrom = [ "Cmd", "Extra" ]
            , name = "addMaybe"
            , annotation =
                Just
                    (Type.function
                         [ Type.function
                             [ Type.var "a" ]
                             (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                         , Type.maybe (Type.var "a")
                         , Type.tuple
                             (Type.var "model")
                             (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                         ]
                         (Type.tuple
                              (Type.var "model")
                              (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                         )
                    )
            }
    }