{-# LANGUAGE TypeFamilies #-}

module Main where

import Graphics.QML as QML

import ViewModels

startUiApplication workspace = do
  let view = fileDocument "app/Views/ShellView.qml"
  viewModel <- createShellVM workspace
  runEngineLoop QML.defaultEngineConfig
    { initialDocument = view
    , contextObject = Just $ QML.anyObjRef viewModel
    }

main :: IO ()
main = do
    print "Andromeda Control Software, version 0.1"
    workspace <- createSimulatorWorkspace
    startUiApplication workspace
