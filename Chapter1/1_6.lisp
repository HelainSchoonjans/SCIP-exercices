; to continue
In short, the order of evaluation will determine the result.

Since Scheme uses the applicative order of evaluation, all argumens will be evaluated. Since the function call itself, this will cause a stack oveerflow.

With the applicative oder of evaluation, the recursive call would only happen in the else case, avoiding this problem.