import threading

def execute_asynchronous_thread(functions, arguments=None, kwargs=None):
    Thread(functions=functions, arguments=arguments, kwargs=kwargs)

class Thread():
    """

    """
    def __init__(self, functions, arguments=None, kwargs=None):
        datatype = self.__check_type__(functions)
        if datatype == type(list()):
            pass
        else:
            self._execute_process(function_def=functions, arguments=arguments, kwargs=kwargs)

    def __check_type__(self, object):
        return type(object)

    def _execute_process(self, function_def, arguments=None, kwargs=None):
        if not arguments:
            arguments = ()
        if type(function_def) == type(str("")):
            name = function_def
        else:
            name = function_def.__name__
        process = threading.Thread(name=name, target=function_def, args=arguments, kwargs=kwargs)
        process.start()
