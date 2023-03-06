/// Here we can define any errors we want to handle
/// * Example : unAuthenticated, unAuthorized, networkError, apiError, etc ..
enum AppErrorType {
  // api error
  api,

  // failed to generate new color
  cannotGenerateNewColorFromColorEntity,

  // any unDefined error
  unDefined,
}
