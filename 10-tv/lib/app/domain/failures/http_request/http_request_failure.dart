sealed class HttpRequestFailure {}

class HttpRequestFailureNotFound extends HttpRequestFailure {}

class HttpRequestFailureNetwork extends HttpRequestFailure {}

class HttpRequestFailureUnauthorized extends HttpRequestFailure {}

class HttpRequestFailureUnknown extends HttpRequestFailure {}
