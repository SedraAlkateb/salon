// ignore_for_file: file_names

import 'package:salon/presentation/common/state_renderer/state_renderer.dart';
import 'package:salon/presentation/common/state_renderer/state_renderer_imp.dart';
import 'package:flutter/cupertino.dart';

void loading(BuildContext context)
{
  LoadingState(
      stateRendererType:
      StateRendererType.popupLoadingState)
      .showPopup(
      context,
      StateRendererType.popupLoadingState,
      "loading");
}
void loadingFullScreen(BuildContext context)
{
  LoadingState(
      stateRendererType:
      StateRendererType.fullScreenLoadingState)
      .showPopup(
      context,
      StateRendererType.fullScreenLoadingState,
      "");
}
void error(BuildContext context,String massage,int code)
{
  ErrorState ( StateRendererType.popupErrorState,
      massage )
      .dismissDialog(context);
  ErrorState(StateRendererType.popupErrorState,
      massage)
      .showPopup(
      context,
      StateRendererType.popupErrorState,
      massage);


}
void success(BuildContext context){
  ContentState().dismissDialog(context);
}