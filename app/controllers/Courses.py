
from system.core.controller import *

class Courses(Controller):
    def __init__(self, action):
        super(Courses, self).__init__(action)
        """
        This is an example of loading a model.
        Every controller has access to the load_model method.
        """
        self.load_model('Course')
        self.db = self._app.db

    def index(self):
        all_courses = self.models['Course'].get_all_courses()
        return self.load_view('index.html', courses =  all_courses)

    # This is how a method with a route parameter that provides the id would work
    # We would set up a GET route for this method
    def show_confirm(self, id):
        # Note how we access the model using self.models
        course = self.models['Course'].get_course_by_id(id)
        return self.load_view('show.html', course=course[0])

    # This is how a method used to add a course would look
    # We would set up a POST route for this method
    def add(self):
        # in actuality, data for the new course would come 
        # from a form on our client
        course_details = {
            'name': request.form['course_name'],
            'description': request.form['course_description']
            }
        self.models['Course'].add_course(course_details)
        return redirect('/')

    
    def delete(self, course_id):
         self.models['Course'].delete_course(course_id)
         return redirect('/')

        # This is how a method used to update a course would look
    # We would set up a POST route for this method
    # def update(self, course_id):
    #     # in actuality, data for updating the course would come 
    #     # from a form on our client
       
    #     self.models['Course'].update_course(course_details)
    #     return redirect('/')


